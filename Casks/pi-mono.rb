cask "pi-mono" do
  arch arm: "arm64", intel: "x64"

  version "0.70.2"
  sha256 arm:   "4e039050367d82bff963e15fea8d85ca268f7b0284b83f5f15939aad087353a4",
         intel: "0ffed2128efb469ef23c46f861cd1d848022153ba7247dab3ee7ea41bf6c3864"

  url "https://github.com/badlogic/pi-mono/releases/download/v#{version}/pi-darwin-#{arch}.tar.gz"
  name "Pi"
  desc "AI agent toolkit: coding agent CLI, unified LLM API, TUI & web UI libraries, Slack bot, vLLM pods"
  homepage "https://github.com/badlogic/pi-mono"

  livecheck do
    url :url
    strategy :github_releases
  end

  binary "pi/pi"
end
