class SchematicDiff < Formula
  desc "Git diff extension for Minecraft schematic and NBT files"
  homepage "https://github.com/Arcadi4/schematic-diff"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.1.0/schematic-diff-aarch64-apple-darwin.tar.gz"
      sha256 "d74564a2304b54ced37bdac7e8da34d91e51e34d260c67642be0baf2fa6c30ec"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.1.0/schematic-diff-x86_64-apple-darwin.tar.gz"
      sha256 "c1351862a27f93d5c6a35336d527897062fb2f7c0938b6cb63f110efb4e6a1c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.1.0/schematic-diff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe9024037ad66eee4f56b4ffafd0ba075eea3f462fb104d71bd178e7b52823f8"
    end
    on_intel do
      url "https://github.com/Arcadi4/schematic-diff/releases/download/v0.1.0/schematic-diff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42abb39d42b509dc1ea8395ad09450e7e5e965d71d1d10fadde39f3967e532de"
    end
  end

  def install
    bin.install "schematic-diff"
  end

  test do
    assert_match "schematic-diff #{version}", shell_output("#{bin}/schematic-diff --version")
  end
end
