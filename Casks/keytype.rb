cask "keytype" do
  version "1.8.0"
  sha256 "cea72a1ce59d8275d5d143e189186b4e565d403ac78159d102d786a1f0ea44d6"

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
