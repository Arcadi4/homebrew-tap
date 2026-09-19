cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.1"
  sha256 arm:   "6864243eb23c8ffda8f86e659ab5ecc4d21c1c0ac5f08c45c0662e6cc9fee6e8",
         intel: "8006d0954b4a8903ba27a89acc0f7bb631fb000304f6308e04d76081b01fd0ee"

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
