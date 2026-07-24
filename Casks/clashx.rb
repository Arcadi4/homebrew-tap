cask "clashx" do
  version "1.140.0"
  sha256 "90c9ff959baf355cd3bca101db218028b095607cd2c797ae73d446d76eebab0a"

  url "https://github.com/ClashX-Pro/ClashX/releases/download/#{version}/ClashX.dmg"
  name "ClashX"
  desc "Rule-based proxy utility"
  homepage "https://github.com/ClashX-Pro/ClashX"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "ClashX.app"
end
