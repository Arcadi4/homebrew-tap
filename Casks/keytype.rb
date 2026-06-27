cask "keytype" do
  version "1.6.0"
  sha256 "65f445538d913bd5d01e624d86b1b77a3397e9812a7f47ca356fc9c892a3912b"

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
