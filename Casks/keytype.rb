cask "keytype" do
  version "1.5.0"
  sha256 "44eb79dc112d30f3f19e9c927fa667b01ab7ba40b7a9d16c59d967ebd33eef32"

  url "https://github.com/johnbean393/KeyType/releases/download/v#{version}/KeyType.#{version.major_minor}.dmg"
  name "KeyType"
  desc "System-wide tab autocomplete utility"
  homepage "https://github.com/johnbean393/KeyType"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :sonoma

  app "KeyType.app"
end
