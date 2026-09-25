class BililiveCli < Formula
  desc "Follow bilibili live streams from your terminal"
  homepage "https://github.com/Arcadi4/bililive-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.1/bililive_v0.1.1_darwin_arm64.tar.gz"
      sha256 "3aa41041a45340c5fd9836ee7885d511ae542d15439c6a67a3f5e53a45ad807d"
    end
    on_intel do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.1/bililive_v0.1.1_darwin_amd64.tar.gz"
      sha256 "d06950c37d39d78865adf1575fed552dc0c9f3d2ec802658888034b557d8d4e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.1/bililive_v0.1.1_linux_arm64.tar.gz"
      sha256 "21962d4009fe8d83af6bbe0fa2727574e81c0386f361c38d613c11aa48af8108"
    end
    on_intel do
      url "https://github.com/Arcadi4/bililive-cli/releases/download/v0.1.1/bililive_v0.1.1_linux_amd64.tar.gz"
      sha256 "f7911dc3142659a5bc2370dfc17f59f3f0046bed8325ff4c7c45f9b7031d9257"
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
