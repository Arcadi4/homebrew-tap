cask "pi-mono" do
  version "0.82.1"
  on_arm do
    sha256 "ca5b660ee0dbf2b4169f69753cf60f4e0edddff4a49427cdd34660e41280249f"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "a28cd67f9397a5ad99f9387713bf1c134b747d4b6cb25e00db4f7d009ee9f8c2"

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
