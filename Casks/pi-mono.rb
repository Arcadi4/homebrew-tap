cask "pi-mono" do
  version "0.78.1"
  on_arm do
    sha256 "0007e13fe7e86f7d5d5ed4e78411d2be406eea825e9c06e802371463f0d5da5f"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "cd5b43936a0e1efb17998b0cce942f6de67dd5b4442f5288a9ef5f7c43d77ccf"

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
