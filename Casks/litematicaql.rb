cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.3"
  sha256 arm:   "19e4c755e05233cccec4984ecb7d04b59a39d5838ed3bcbf344b36c8091bb548",
         intel: "2f772b22c615fdba8ca9d6aa04f5947ecea5fcd4fb3cf0987889ffba39f9dc85"

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
