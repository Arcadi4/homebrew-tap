cask "pi-mono" do
  version "0.77.0"
  on_arm do
    sha256 "05917ae1fbc47210fd261430a9246a37e9c60d7c08528298f5eaf7b7be0acb4c"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "77aadb47aa4c5304789ad4794a44113a4f6235e6698078a91588fcf7a58ad80a"

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
