cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.4"
  sha256 arm:   "0c9f563a7bff23b7616e25e54cdb0a70791e5b932315d0ef92e62e21287cd64d",
         intel: "d3c597ad0f02bc4f0d28ef5e82e0f691caedc55c54000e18ee6907a4578eee1d"

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
