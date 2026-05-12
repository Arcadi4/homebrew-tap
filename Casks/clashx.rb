cask "clashx" do
  version "1.139.0"
  sha256 "e6f3e51b0bc8e7a4a3a4c0f14cee327a7e62e924c763d9cfd3fd6a40a52f01a9"

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
