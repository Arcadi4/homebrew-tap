cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.0"
  sha256 arm:   "ef93c9489e2440088b486abffd8cbfcd11f9cf59c9d7b7f4ee0e7e41e1a70c38",
         intel: "bfb3f570ac59b79064fa37ccddbabc3e2386b334069931d5d286f8f1c0a5762a"

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
