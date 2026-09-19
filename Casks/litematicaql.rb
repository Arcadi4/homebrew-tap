cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "ba0d2214caa672d9e6912d8ea497c751d7a64b894e8906e43003e90e339e7c35",
         intel: "543a8ce70ce04648ecc384da0133d6eddd333c7036d386c3da02492561bf2e02"

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
