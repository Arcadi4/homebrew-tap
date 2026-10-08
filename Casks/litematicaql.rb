cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.1"
  sha256 arm:   "f6796a545afb3d2b824f3fc2dace33503589089ff4a1edc0042d1713fa28a138",
         intel: "e07849e32d4d8f90300b3d3ac7439ff88e4e7eb2e4282c270b330a91a1241c10"

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
