cask "mission-center" do
  version "1.1.0"
  sha256 "046290c1ceae563fdb5a32fb680cea0faee9b74505a6d4dbdd027a0d3eccd3da"

  url "https://github.com/Hoshino-Yumetsuki/mission-center/releases/download/v#{version}/MissionCenter.dmg"
  name "Mission Center"
  desc "System resource monitor and task manager"
  homepage "https://github.com/Hoshino-Yumetsuki/mission-center"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MissionCenter.app"
end
