cask "pi-mono" do
  version "0.74.2"
  on_arm do
    sha256 "2a1439b3534023a73037615f5516e84e5b2007b4a2ea062e7c8f37e1777b6ac7"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "8a9307f536b7920ff94975489401376bca662c4cfcf09572c5e17b3745bd4cdd"

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
