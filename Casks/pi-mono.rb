cask "pi-mono" do
  version "0.79.8"
  on_arm do
    sha256 "9b0da243210a4faad9b4abb641cac519ce2d9d28eac6b001b9bf24a1bf84f585"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "29a1a3fe63df336a848704259c801caf55eff39e175905b2fb3086b2280ede20"

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
