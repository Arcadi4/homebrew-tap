cask "pi-mono" do
  version "0.73.0"
  on_arm do
    sha256 "1b0cc3f93dcebf56bae6d3484c0571184ee53254fc41da51b160ae77780d2d30"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "b09aa67b8b8d8c50899e307bc9413ed7d21474fee72e60cf9f7fa5765599fb7f"

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
