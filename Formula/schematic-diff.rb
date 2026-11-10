class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "8a3d476604e76752f2decea0415a75b89e39734474748013dd8db62279c54ae1"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "7332aac95d2e045dc0800fee0e394a8b69e9056caab796a1b5879a2f97560277"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5baf3504a6b89478f2a7a112bd21388c01e711982312dd285a047c9a66e567f9"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.4.0/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "235238cf345ea72590ff337bec6e76aceb2b5189464a9f31a8c0bd4d2015fad3"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
