cask "pi-mono" do
  version "0.80.10"
  on_arm do
    sha256 "4406ed227c486f2e3c16cf14f793dc3ad46b5d01bf69135a2424cffa58a9a34b"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "892b3f385ae6779299c07a25d9280183897fcf755f7226f6b36c70d268f321be"

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
