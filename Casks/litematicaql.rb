cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.1"
  sha256 arm:   "96eb0ef35b53efd7349f55d6619aaf6f129e62488bf3e611faccc461d6d78dcc",
         intel: "2c3db6e70669519e1d7759e36ee6ba32861df628e4646f0082864d5e7b8bea04"

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
