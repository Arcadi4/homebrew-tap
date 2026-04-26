cask "pi-mono" do
  version "0.70.2"

  on_arm do
    sha256 "4e039050367d82bff963e15fea8d85ca268f7b0284b83f5f15939aad087353a4"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "0ffed2128efb469ef23c46f861cd1d848022153ba7247dab3ee7ea41bf6c3864"

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
