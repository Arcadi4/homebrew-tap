cask "pi-mono" do
  version "0.84.1"
  on_arm do
    sha256 "683c84261f40b870b4a7ccf181a48ad6ecd71853b0112d1bb617539530c6121d"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "f9060962b9cca5438d7fb97b60adae9c9302503d39b68d8aea8b891e2eb3e786"

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
