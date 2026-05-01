cask "pi-mono" do
  version "0.71.1"
  on_arm do
    sha256 "335f34851384a483084501d111af538a702f060bf2729d2ea0e2d1b339ff7f9d"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "cb5f7c478106e62a7be6e2e404c3a866068db665bc2e689c506b434b5ac7dbe5"

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
