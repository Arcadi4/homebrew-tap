cask "pi-mono" do
  version "0.75.0"
  on_arm do
    sha256 "e5845d875e7471fea51afdcbf266155d7002b0caac7556c08f8fe389270a1d87"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "bd337adfd0edc9c6d281153020714cd5c51ebd6730d79ccce2e3e2447c650688"

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
