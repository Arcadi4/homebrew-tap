cask "pi-mono" do
  version "0.71.0"
  on_arm do
    sha256 "2e5fc98b250ecb2c064762e0e7521831a20956cf78e1542ada5c37c78ff60807"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "4a39821e42164254f70ce0b26cf819ac99072f790daee5d185710e88298e4b40"

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
