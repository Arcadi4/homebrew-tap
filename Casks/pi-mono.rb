cask "pi-mono" do
  version "0.80.6"
  on_arm do
    sha256 "f9cd7ed20e50e234d6f1f2634b2e372ed073dc31070381f975bdb6d1a8bdd1c9"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "49d5a07ec7f34ffe34ec76e3356d1c2a7b2f13554cf7c7974d47cf7f878e603f"

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
