cask "pi-mono" do
  version "0.81.1"
  on_arm do
    sha256 "a24834019ec02ee5a475ff1c5a5e9f838974191ba6adc4348f6e6475a7c7667b"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "ecaed0ef0fcaeff2e475294fc34b2d7de4700434ab9df23cdb0fffd9cfadf5b8"

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
