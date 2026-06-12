cask "pi-mono" do
  version "0.79.2"
  on_arm do
    sha256 "dbdbb5e65c34fea6dc04411c5d7314f54a6595a8392d3f05896dfe6d7133f4b4"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "ed8485c35ed5aed651cbd92dbe986828c1b580cd096bda058249fc98c0f7679a"

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
