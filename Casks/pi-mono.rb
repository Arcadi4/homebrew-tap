cask "pi-mono" do
  version "0.75.4"
  on_arm do
    sha256 "36580920657efa192b5c8a6ad3a34d7531c7b5450931a459273e75bb157aa09d"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "4d08aaae2142fd951129922066ccb0cce3db7d37c32268ea530abe723af36c5e"

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
