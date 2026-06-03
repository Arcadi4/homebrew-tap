cask "keytype" do
  version "1.3.0"
  sha256 "b70c1de61ab56fb8bbc8d295b2c8fa8e25ea74d8201f1b565bc03fde756dc361"

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
