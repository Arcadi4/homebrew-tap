cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.5"
  sha256 arm:   "70e45b37d6808497ac86deb756331fcbd6f0e18d1b00e71aba81850928b31d64",
         intel: "c07039c7a9d1842fcb573a04d976e166f4f77fa75e473ef1c3d41a89da56554d"

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
