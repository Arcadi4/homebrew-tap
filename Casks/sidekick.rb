cask "sidekick" do
  version "1.0.0-rc.18"
  sha256 "1db652cca6617a6da500b96a5841d5c67c22c77637e7203543cb5872183eb794"
  url "https://github.com/johnbean393/Sidekick/releases/download/1.0.0-rc.18/Sidekick.1.0.0-rc.18.dmg",
      verified: "github.com/johnbean393/Sidekick/"
  name "Sidekick"
  desc "A native macOS app that allows users to chat with a local LLM that can respond with information from files, folders and websites on your Mac without installing any other software. Powered by llama.cpp."
  homepage "https://github.com/johnbean393/Sidekick"

  app "Sidekick.app"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+(?:-rc\.\d+)?)$/i)
  end
end
