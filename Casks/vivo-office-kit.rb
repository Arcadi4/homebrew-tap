cask "vivo-office-kit" do
  version "6.7.2,1782470210193"
  sha256 "dfd41428bbb53e8590ea3ac38aa011082ffdcec06bc0271295b077ae1d99c816"

  url "https://pcsuite-api-static.vivo.com/upgrade-pre/pcsuite_setup_v#{version.csv.first}-cn_#{version.csv.second}.pkg",
      user_agent: :browser
  name "vivo Office Kit"
  name "vivo办公套件"
  desc "Multi-device client for screen mirroring, file transfer, and remote control"
  homepage "https://pc.vivo.com/"

  livecheck do
    url "https://pcsuite-api.vivo.com/version/download/mac/full"
    strategy :header_match do |headers|
      match = headers["location"]&.match(/pcsuite_setup_v?(\d+(?:\.\d+)+)-[a-z]+_(\d+)\.pkg/i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on :macos

  pkg "pcsuite_setup_v#{version.csv.first}-cn_#{version.csv.second}.pkg"

  uninstall quit:    "com.vivo.pcsuite",
            pkgutil: "com.vivo.pcsuite"

  zap trash: [
    "~/Library/Application Support/PCSuite",
    "~/Library/Preferences/com.vivo.pcsuite.plist",
    "~/Library/Saved Application State/com.vivo.pcsuite.savedState",
  ]
end
