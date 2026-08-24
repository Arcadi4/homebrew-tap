cask "pi-mono" do
  version "0.84.3"
  on_arm do
    sha256 "0120c9f99ea05fe801e6e7c2c9d91dd65636563ca0803711b37b9f32920d4b63"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "b99706b3254faaf3695395ecb69cb7e1f4d4822bd3f832e6d1f2636d896b6bde"

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
