cask "pi-mono" do
  version "0.79.3"
  on_arm do
    sha256 "bdb0c2cf76d6b2f2a823d8402c2c0834050ce513cd374dfc63a2d0ebc83ca9ea"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "838938c2f411cc91f594a9d6011f2c2eb7070173ebd2932b0b3b81c01ec76763"

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
