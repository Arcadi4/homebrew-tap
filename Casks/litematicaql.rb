cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.5"
  sha256 arm:   "514e2309b7b96564afb3b90d88cf3c9fbeea78aec5802e3d381bd14b62fad859",
         intel: "4be8edef1a6231750cbfd693a6c9c43ce935ea4361e462d096def0fa248e29d1"

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
