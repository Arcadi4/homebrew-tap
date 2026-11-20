cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.6"
  sha256 arm:   "34c131dceb0a9dff9c94d7c3461dd81311dad6e890efc45581fbb55c4e843b39",
         intel: "ec104914ee93119305627ce485aab44c08ea3fc14f032e580d64471710c6a9d9"

  # Packages are built by `just release`, which names the archives with the bare
  # version even though the tag keeps its leading v. The Cloudflare mirror serves
  # those release archives unchanged, so the checksums above match both hosts.
  url "https://download.arcadia.moe/litematicaql/LitematicaQL-#{version}-#{arch}.zip"
  name "LitematicaQL"
  desc "Quick Look preview extension for Litematica schematics"
  homepage "https://github.com/Arcadi4/LitematicaQL"

  # The mirror has no version index, so new releases are still discovered from
  # the GitHub release tags; only the download URL points at the mirror.
  livecheck do
    url "https://github.com/Arcadi4/LitematicaQL"
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "LitematicaQL.app"
end
