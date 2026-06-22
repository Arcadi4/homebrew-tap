cask "pi-mono" do
  version "0.79.10"
  on_arm do
    sha256 "6d1b9e99ce6392a871a4a886b1fbac040b51c24bd65221ae0573b0e7b8bbb30b"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "1d6dba8e004470808730c7f005ed521fd152c2cd268fb013cf6cb6c210cff2ff"

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
