cask "pi-mono" do
  version "0.83.0"
  on_arm do
    sha256 "147fc3c451ec543a15102af251ce316079c8fcadfe8ae4d3ffee202346e9bed9"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "9ab12e406e545be131d1279a9a2c0d5c0d4a3c6e9d86a52700a7a135a445041b"

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
