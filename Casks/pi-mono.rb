cask "pi-mono" do
  version "0.82.0"
  on_arm do
    sha256 "6205debd0071ff56d765e0ee941f087f9a18d1f6c2f7dea17bdc8f97ff3cf9c1"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "a7541c599f5c235c9cef8ba5086986c0f8897a0c6a9389a2b8b1b3a59b76bfc8"

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
