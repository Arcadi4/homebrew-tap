class KiroRs < Formula
  desc "Expose Kiro as an Anthropic-compatible API service"
  homepage "https://github.com/Hoshino-Yumetsuki/kiro.rs"
  license "MIT"
  head "https://github.com/Hoshino-Yumetsuki/kiro.rs/archive/refs/heads/master.tar.gz"

  depends_on "node" => :build
  depends_on "rust" => :build

  def install
    ENV["COREPACK_ENABLE_DOWNLOAD_PROMPT"] = "0"

    system "npx", "--yes", "--package", "pnpm", "pnpm", "--dir", "admin-ui", "install", "--frozen-lockfile"
    system "npx", "--yes", "--package", "pnpm", "pnpm", "--dir", "admin-ui", "build"
    system "cargo", "install", *std_cargo_args

    (buildpath/"config.json").write <<~JSON
      {
        "host": "127.0.0.1",
        "port": 8990,
        "apiKey": "sk-kiro-rs-change-me",
        "region": "us-east-1",
        "tlsBackend": "rustls"
      }
    JSON
    (etc/"kiro.rs").install "config.json"

    (buildpath/"credentials.json").write "[]\n"
    (var/"kiro.rs").install "credentials.json" unless (var/"kiro.rs/credentials.json").exist?
  end

  service do
    run [opt_bin/"kiro-rs", "--config", etc/"kiro.rs/config.json", "--credentials", var/"kiro.rs/credentials.json"]
    keep_alive true
    log_path var/"log/kiro-rs.log"
    error_log_path var/"log/kiro-rs.log"
  end

  test do
    assert_match(/kiro-rs \d+\.\d+\.\d+/, shell_output("#{bin}/kiro-rs --version"))

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
