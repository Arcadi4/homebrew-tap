cask "pi-mono" do
  version "0.79.7"
  on_arm do
    sha256 "2961795fdb933f0a37611cd9913dbee22ad82c5ecb4c38a67539f353fd973d6b"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "641ec7a688fcf67fd7aee36410663d44b0c0d275708321c717c33349a42abd15"

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
