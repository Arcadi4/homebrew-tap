cask "pi-mono" do
  version "0.79.0"
  on_arm do
    sha256 "7d8ea65dbbf4e1ef0f309fb17e21780c6d61e20334c66135e5513ceac230584a"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "89d6225488c855bfeacd8f2fe8645b10defd91aeabf7f04273ee950668e8e2ef"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-x64.tar.gz"
  end

  name "Pi"
  desc "AI agent toolkit with CLI, unified LLM API, TUI, and web UI libraries"
  homepage "https://github.com/badlogic/pi-mono"

  livecheck do
    url :url
    strategy :github_releases
  end

  binary "pi/pi"
end
