class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.3.0/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "9dd47026b2c2f56583e41b92523ae28746c52400f86b768813b246b0aa7666ae"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.3.0/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "4a9d75740f90a83cba4101094f47d419afcce1c88ec9ae2208c0cc827c44622d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.3.0/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d5c7b510c335e82f7dc20830f92c71a05588215924ede8134e7a88cef268360"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.3.0/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b8127992a4fc3ca8bb67539f283b495e74371f2a4e287b311a3db9c7ca2abbc"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
