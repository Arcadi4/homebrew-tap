cask "keytype" do
  version "1.4.0"
  sha256 "4fedb305d457e1117f4c81d77985e45aa7a79cd6a25ae99a711660af4e7e6f4b"

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
