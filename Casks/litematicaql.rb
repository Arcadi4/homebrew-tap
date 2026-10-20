cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.3"
  sha256 arm:   "11c117ddd77560d4fb219e8b2ce381b15fc75f7968df261d6f9fec66ecaa28dc",
         intel: "c902b6e083794e70bbbe80df803cbf0a54e117a2132fbd4d5468112bb8789eb2"

  # The tag keeps its leading v, but `just release` names the archives with the
  # bare version.
  url "https://github.com/Arcadi4/LitematicaQL/releases/download/v#{version}/LitematicaQL-#{version}-#{arch}.zip"
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
