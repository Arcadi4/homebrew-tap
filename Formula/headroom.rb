class Headroom < Formula
  desc "Compress LLM context through a local proxy"
  homepage "https://github.com/headroomlabs-ai/headroom"
  url "https://github.com/headroomlabs-ai/headroom/releases/download/v0.27.0/headroom_ai-0.27.0.tar.gz"
  sha256 "1b133c7f9de9fbebd266df2d407fc4529d4d0f4276faedad838d39ed2bdc0af0"
  license "Apache-2.0"

  depends_on "python@3.13"
  depends_on "uv"

  def install
    (bin/"headroom").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("uv")}/uvx" --python "#{formula_opt_bin("python@3.13")}/python3.13" --from "headroom-ai[all]==#{version}" headroom "$@"
    SH
  end

  service do
    run [opt_bin/"headroom", "proxy", "--host", "127.0.0.1", "--port", "8787"]
    keep_alive true
    log_path var/"log/headroom.log"
    error_log_path var/"log/headroom.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/headroom --version")
    port = free_port
    pid = fork do
      exec bin/"headroom", "proxy", "--host", "127.0.0.1", "--port", port.to_s, "--stateless"
    end
    health_url = "http://127.0.0.1:#{port}/health"
    begin
      30.times do
        break if quiet_system "curl", "-fsS", health_url

        sleep 1
      end
      assert_match "ok", shell_output("curl -fsS #{health_url}")
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
