cask "nix" do
  version "3.21.7"
  sha256 "798d85f50e3b33ad79d3be921b123d343c455d42decb9a1b33334cdf80ed6183"

  url "https://install.determinate.systems/determinate-pkg/tag/v#{version}/Universal"
  name "Determinate Nix"
  desc "Multi-user installer for the Nix package manager"
  homepage "https://determinate.systems/"

  livecheck do
    url "https://install.determinate.systems/determinate-pkg/stable/Universal"
    strategy :header_match
  end

  depends_on :macos

  pkg "Determinate.pkg"

  uninstall script: {
    executable: "/nix/nix-installer",
    args:       ["uninstall"],
    sudo:       true,
  }
end
