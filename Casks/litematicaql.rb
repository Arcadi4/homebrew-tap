cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.1"
  sha256 arm:   "96eb0ef35b53efd7349f55d6619aaf6f129e62488bf3e611faccc461d6d78dcc",
         intel: "2c3db6e70669519e1d7759e36ee6ba32861df628e4646f0082864d5e7b8bea04"

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
