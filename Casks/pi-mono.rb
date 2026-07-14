cask "pi-mono" do
  version "0.80.7"
  on_arm do
    sha256 "0f15771ef76ecd69b03e28fecf0c512593ff6e2477acf39e35bc2c8a4056d1e3"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "3e71ac3aa4ba6cd92f7f8c704e06282b4413842877e7670b2dce3b1bf422318d"

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
