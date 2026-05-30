cask "pi-mono" do
  version "0.78.0"
  on_arm do
    sha256 "68ebbe4f56a136a1c7bace3393eca4ad0aa1fd9f253b797fd370058bd39fe070"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "66074b271260068199f47738a172397f1e0b5a3334697dd2acea35bbd3470b1c"

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
