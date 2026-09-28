cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.0"
  sha256 arm:   "954a9f67b939864e8272fcfb4833797797e0e01aa55a41ca87a700a828694ba4",
         intel: "e4ad46a1ce58e59c6e64b6e6722a3f04cdc370c5c1ed853c33429c9afd67a84b"

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
