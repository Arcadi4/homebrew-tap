class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.2/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "5211dd240223e31d45f47e67cc3c0e5c8acbca0ccfcceaebb2cbef6ecdd19a06"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.2/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "fa3ee664418df1b68910733e74b239b5df09b7d7d02cdd5d95e78f7f4d68c1a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.2/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "018e82bff20819c8c246edfffd46ebfd695a1cb273c2b59e12de429e022b4ad7"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.2/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0059f007ce639dadb62f7bfc9d925840cbf253d49c7e063a626010cc982c475f"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
