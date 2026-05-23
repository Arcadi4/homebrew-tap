cask "pi-mono" do
  version "0.75.5"
  on_arm do
    sha256 "eb8f039c41e87b1431c82baa97f807c4d391b77d66ecb41e096270ae36f9362d"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "2556c5166b495b8380ae50b59ed61cf2e6c4d7d231c0df0ed214d9de49f47dac"

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
