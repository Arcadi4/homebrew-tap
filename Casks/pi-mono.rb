cask "pi-mono" do
  version "0.84.0"
  on_arm do
    sha256 "2eb639474976e3a08c560a197be5077a427a4120fddfd5cecf89ff87bd043934"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "7e8a94080302b5efef3c7500d8d88b1e8b6d87852a506d81075a5fe250a0d973"

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
