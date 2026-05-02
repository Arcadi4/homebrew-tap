cask "pi-mono" do
  version "0.72.1"
  on_arm do
    sha256 "40b2f027fc0f581317072921bf2e7ddfec871c3a4e94b73c39d73fc2abc5e517"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "59aa55b483cd42d78079f1a3b6244f8baebb63ea4dec8208d72eb0bf2df69aa2"

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
