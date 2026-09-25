cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.2"
  sha256 arm:   "5724e06bdc2faeabe8c3b1f28b2888ea2b6d83cacc2c0f640a839ebe74a7b667",
         intel: "06447f10fa582483a51596af7634d973be2e2bda03d238612fbe348ef92abebb"

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
