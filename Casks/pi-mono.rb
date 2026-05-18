cask "pi-mono" do
  version "0.75.3"
  on_arm do
    sha256 "2d16668d626805ea73d430b178b22f5341152c7c13544c46f89d68058e0bbf81"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "2432cf0b6a984d3fb6d029b5fd650862a42cce921b25bd5b6d17ce9afcc3e69a"

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
