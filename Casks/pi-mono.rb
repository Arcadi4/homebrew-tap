cask "pi-mono" do
  version "0.80.3"
  on_arm do
    sha256 "072789f5f5571198bd2d856f1ac4bbc980eecce1d02e7d0acf896e2387e3ee8f"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "c1e007bd68cf3779f09476f9c06de5fc93a00733d4ae34a36a96180156ff1e7f"

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
