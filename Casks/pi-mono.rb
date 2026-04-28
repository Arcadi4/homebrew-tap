cask "pi-mono" do
  version "0.70.6"
  on_arm do
    sha256 "82b19e956a46e5c0b9792eb1385b5b618bf318f5d8ad22e26439d4a36ab89402"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "03b36df8673db7060acea32ad9424e6570b24ddebadc2710f38f95999aa5ec44"

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
