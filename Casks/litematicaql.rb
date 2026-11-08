cask "litematicaql" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.2"
  sha256 arm:   "f1f59c5336c7e56bc6e6ddbff43159bf7cd2d60db174f42356431a4bd5cb044b",
         intel: "13fe7a5b89976a9b278ccefcb3d361d71cf20780ca1c0233fd1c067d2ef67d61"

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
