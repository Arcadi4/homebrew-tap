cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.3"
  sha256 arm:   "f850f5e99660a31da24e8432a0000fbb02975bfe62edfc817247c93d8c957ae5",
         intel: "32da23fb4764cdb3b3de498ea83326dc66ed17b844f1790456c2905010d624ed"

  url "https://github.com/Arcadi4/LitematicaQL/releases/download/v#{version}/LitematicaQL-v#{version}-#{arch}.zip"
  name "LitematicaQL"
  desc "Quick Look preview extension for Litematica schematics"
  homepage "https://github.com/Arcadi4/LitematicaQL"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "LitematicaQL.app"
end
