cask "pi-mono" do
  version "0.79.1"
  on_arm do
    sha256 "763894f9e560b7eb30f287b2115a52bffae3d6f3453a6d51be525840591f6575"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "7db13fe8d3c65823d6efb1f98136bf26289842c2e6a66fc893d20c334c0bbbb3"

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
