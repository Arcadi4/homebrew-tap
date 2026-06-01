cask "keytype" do
  version "1.2.0"
  sha256 "1fb1015581c36e65f813e9cb182d63bcf164c78a686abf7ad7d2cfe8878efbaa"

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
