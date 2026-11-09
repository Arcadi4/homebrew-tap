class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "9136554963bde62d065890d9925dbf6ee05709c437ad5fe716ce0848da267854"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "af61a857a9c9eb87a465c181f6ab8e442f725e564855a12c04ff734fb2c5a22b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4fbab60f667a5c6c12a5a01fc2e038baad52e14090695d080673397d7c46e19"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a35c40c7e5c8c1c2fad3e39dc9f945aa010e23e3361fffa30688bd20b41a1317"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
