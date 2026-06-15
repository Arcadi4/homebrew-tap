cask "pi-mono" do
  version "0.79.4"
  on_arm do
    sha256 "8fb94015b367c3bf2e77a5b58bcc4328c0a487ad830e1eaea9195c665bb4c2c9"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "ac1155f337c197d4ad8b2adc0c78299e17e40735e582bf01b562c2d86bbf38d9"

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
