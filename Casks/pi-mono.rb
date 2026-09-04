cask "pi-mono" do
  version "0.85.0"
  on_arm do
    sha256 "b0a1a3ab9708047e31b76a27911e8b445b3e4a38e2f46a08b6635df75f3499c0"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "611290e032a47f1546bd30e12c14a59a600a24662d5239c0c159ef3c7a0ca3b0"

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
