cask "pi-mono" do
  version "0.84.4"
  on_arm do
    sha256 "c68e3ac4d05b4e282aaab2e6c76f161d3e9e68f19a22e38913cbfaadb6c800f0"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "7a042d6413065421387001a4986190a1a03186c95a695f4dee0bdc76e60de8f7"

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
