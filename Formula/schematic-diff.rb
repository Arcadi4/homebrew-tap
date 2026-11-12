class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.1/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "ba86381dbfaa27b94b1e853b1cb7d8b65f2145a4307c35de9c655eed4400cb08"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.1/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "a141d95f47afa845b0a4bb06ce631ce38665566497785950c3c0e940d3c7d2be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.1/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51eed9690e9a5795c34b0d1a6594475aa1a6134a36ff312faf09d600565b881c"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.1/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee706c8d8fc9bfcef41a81b2a4e28b45db0ae5736c1e9304659eedcb8af80621"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
