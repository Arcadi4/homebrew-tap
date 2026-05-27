cask "pi-mono" do
  version "0.76.0"
  on_arm do
    sha256 "6f21bb0c63527568d807d7ae2db6886ff7d27524673675100c684ffc996afce5"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "0ee0c4b16460f65ffbc1ac0589733e963d0486e33831bbd69c4389a4a74ecbf0"

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
