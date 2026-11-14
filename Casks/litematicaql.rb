cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.4"
  sha256 arm:   "72435203d6753ca499b61cd1e7eb0b5b5e99a9b337b726d47a188e84088a7854",
         intel: "000795f41a21609ba87d8cd79d7e4d3cd4b8c2463f1f1e12d9a9835e0456dec1"

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
