class KiroRs < Formula
  desc "Expose Kiro as an Anthropic-compatible API service"
  homepage "https://github.com/BenedictKing/kiro.rs"
  version "1.1.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BenedictKing/kiro.rs/releases/download/v#{version}/kiro-rs-darwin-arm64"
      sha256 "936e970f166aa3bf16bad1c0bc4afb79649068112612d84b97230132d0330e06"
    end

    on_intel do
      url "https://github.com/BenedictKing/kiro.rs/releases/download/v#{version}/kiro-rs-darwin-amd64"
      sha256 "f50f0d247b65d1d2da260444bfa1558c970c2dfc06832f6bbf71b01cddd327ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BenedictKing/kiro.rs/releases/download/v#{version}/kiro-rs-linux-arm64"
      sha256 "a1bd78ab0879afcbb94676ad3b8e9dc6518f31b742676008d1fb1e72606b1f3e"
    end

    on_intel do
      url "https://github.com/BenedictKing/kiro.rs/releases/download/v#{version}/kiro-rs-linux-amd64"
      sha256 "e28c787853240b40e502613f46473118fc743885598843bbe61de31fe99d09f8"
    end
  end

  def install
    bin.install Dir["kiro-rs-*"][0] => "kiro-rs"

    (buildpath/"config.json").write <<~JSON
      {
        "host": "127.0.0.1",
        "port": 8990,
        "apiKey": "sk-kiro-rs-change-me",
        "region": "us-east-1",
        "tlsBackend": "rustls"
      }
    JSON
    (etc/"kiro-rs").install "config.json"

    (buildpath/"credentials.json").write "[]\n"
    (var/"kiro-rs").install "credentials.json" unless (var/"kiro-rs/credentials.json").exist?
  end

  service do
    run [opt_bin/"kiro-rs", "--config", etc/"kiro-rs/config.json", "--credentials", var/"kiro-rs/credentials.json"]
    keep_alive true
    log_path var/"log/kiro-rs.log"
    error_log_path var/"log/kiro-rs.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiro-rs --version")

    port = free_port
    (testpath/"config.json").write <<~JSON
      {
        "host": "127.0.0.1",
        "port": #{port},
        "apiKey": "sk-test",
        "region": "us-east-1"
      }
    JSON
    (testpath/"credentials.json").write "[]\n"

    pid = fork do
      exec bin/"kiro-rs", "--config", testpath/"config.json", "--credentials", testpath/"credentials.json"
    end
    sleep 2
    begin
      assert_match "data", shell_output("curl -s -H 'x-api-key: sk-test' http://127.0.0.1:#{port}/v1/models")
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
