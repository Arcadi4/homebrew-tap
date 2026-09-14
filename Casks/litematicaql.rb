cask "litematicaql" do
  version "1.0.0"
  sha256 "e5685fda0138afa4e5f9786b67d73e7f4b5c9e945f2a72e5d307e0fa5cf29477"

  url "https://github.com/Arcadi4/LitematicaQL/releases/download/v#{version}/LitematicaQL-#{version}.zip"
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
