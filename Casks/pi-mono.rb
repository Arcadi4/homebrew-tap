cask "pi-mono" do
  version "0.74.1"
  on_arm do
    sha256 "e1b37f951544650836b5a42dfea4fa4cf6531e44111e85ed29df8f41f6c84a35"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "4f73ad8f6ea2097c7a6d48c77b22297677d6b0b0adfb54a825582ad27e5beeff"

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
