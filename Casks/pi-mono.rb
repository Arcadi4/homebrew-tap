cask "pi-mono" do
  version "0.80.2"
  on_arm do
    sha256 "c7d125bbdebd863fa76d92274458ba0eb405e5cde39db34db1f49f767ed9f1dd"

    url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "d4b6b62a0c34c0f2e4cb16ee6fd4f0086b86ad70e0488fd3daa9231216d84e2b"

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
