cask "pi-mono" do
  version "0.74.0"
  on_arm do
    sha256 "3063179823c6a985634312240c57015024316f7fe6661edd41f14c77d8b15e10"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "fa65c98f2c651ec2f89fb1a8a3dc9b987947bc9b102361a2f178862abacc7560"

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
