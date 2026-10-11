cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.2"
  sha256 arm:   "d4466d939bcd550a459c7a80ffc1e24171ba6aa6b591e538a3a4da0e3b23146b",
         intel: "2b5f093cad03a98b02f8a5b149fc8998a2c9fa2f50d257237e15a62798d48541"

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
