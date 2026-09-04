class BililiveCli < Formula
  desc "Follow bilibili live streams from your terminal"
  homepage "https://github.com/Arcadi4/bililive-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.0/bililive_v0.1.0_darwin_arm64.tar.gz"
      sha256 "744f5c2def9f160a2c91b27a8975704d8e0e22b9519d96753a84045747ebe755"
    end
    on_intel do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.0/bililive_v0.1.0_darwin_amd64.tar.gz"
      sha256 "8255b55e3c2235d8946064491614570e4a9aee5a65ee838cd3c9a507b1574519"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.0/bililive_v0.1.0_linux_arm64.tar.gz"
      sha256 "40c4a958a285ee354c1c55897abda2595a8f4c3398c1421896000ec4b9ed83c5"
    end
    on_intel do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.0/bililive_v0.1.0_linux_amd64.tar.gz"
      sha256 "6664e4b3ad02edbdfb1b1cc97161c4cf897f2fc469baff94676f97b5dc258156"
    end
  end

  def install
    bin.install "bililive"
    bin.install_symlink "bililive" => "bililive-cli"
  end

  test do
    assert_match "bililive version v#{version}", shell_output("#{bin}/bililive --version")
    assert_match "bililive version v#{version}", shell_output("#{bin}/bililive-cli --version")
  end
end
