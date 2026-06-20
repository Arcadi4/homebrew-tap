cask "pi-mono" do
  version "0.79.9"
  on_arm do
    sha256 "9632bf30c89a87e2dc674e2450156806187311d293b0fffbc15077ac51e46d48"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "4cdc3990b8091854c97ff4a1792b78c9a2303e6090df6760b5252008d63d61f9"

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
