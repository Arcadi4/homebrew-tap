cask "sidekick-ai" do
  version "1.0.0-rc.18"
  sha256 "1db652cca6617a6da500b96a5841d5c67c22c77637e7203543cb5872183eb794"

  url "https://github.com/johnbean393/Sidekick/releases/download/#{version}/Sidekick.#{version}.dmg"
  name "Sidekick"
  desc "Chat with a local LLM that can use information from files, folders and websites"
  homepage "https://github.com/johnbean393/Sidekick"

  livecheck do
    url :url
    strategy :github_releases do |json, regex|
      json.filter_map { |release| release["tag_name"]&.[](regex, 1) }
    end
    regex(/^v?(\d+(?:\.\d+)+(?:-rc\.\d+)?)$/i)
  end

  depends_on macos: :sequoia

  app "Sidekick.app"
end
