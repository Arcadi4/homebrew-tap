class CliproxyapiYumetsuki < Formula
  desc "Wrap Gemini, Codex, Claude Code, Qwen Code as an API service - Yumetsuki's fork"
  homepage "https://github.com/Hoshino-Yumetsuki/CLIProxyAPI"
  license "MIT"
  head "https://github.com/Hoshino-Yumetsuki/CLIProxyAPI.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
      -X main.Commit=#{tap.user}
      -X main.BuildDate=#{time.iso8601}
      -X main.DefaultConfigPath=#{etc/"cliproxyapi.conf"}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"cli-proxy-api"), "./cmd/server/"
    etc.install "config.example.yaml" => "cliproxyapi.conf"
  end

  service do
    run [opt_bin/"cli-proxy-api"]
    keep_alive true
  end

  test do
    assert_path_exists bin/"cli-proxy-api"
  end
end
