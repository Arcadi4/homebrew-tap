cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.0"
  sha256 arm:   "8d7f005f896676e02b1c6d85e2bc2623f1f330a15d8461465377f0c9c11278f8",
         intel: "a1b3aa75e3aa09102257754a9fff8da679ca3c08bc9a4064975e1733eb21b501"

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
