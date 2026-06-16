cask "pi-mono" do
  version "0.79.6"
  on_arm do
    sha256 "ec0d7bf5c855376fb904732e702b1ad3b4fa5425bf6fe66e0fd90d1cc2f57595"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "b800ac6936f4d9ab93c229a2920a64e3e9fd23e45c1718b95f18e09aecd67572"

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
