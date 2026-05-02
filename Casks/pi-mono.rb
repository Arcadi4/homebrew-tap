cask "pi-mono" do
  version "0.72.0"
  on_arm do
    sha256 "e2bd2e2415d89a52e8ebb16df3c3dc2280a9d32338ef5c0e9b93494215e10af1"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "18812d343f72ba7e52098937236ba4d943b751845d815ec210d96b0da3817fae"

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
