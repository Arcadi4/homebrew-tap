cask "keytype" do
  version "1.7.0"
  sha256 "f82326a442d9f99c41af4bc145e8608c5a9e63ceacb7d1320dc221502bec9736"

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
