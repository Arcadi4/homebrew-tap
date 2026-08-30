class PnpmAT12 < Formula
  desc "Fast, disk space efficient package manager"
  homepage "https://pnpm.io/"
  url "https://registry.npmjs.org/pnpm/-/pnpm-12.1.0.tgz"
  sha256 "6f82b31bb66cfdf19b2841c93e6751300ddec90daf6b363a6171e41535f00245"
  license "MIT"

  # pnpm 12 is a native (Rust) binary, distributed per platform as a GitHub
  # release asset. The npm package is only used here as the version anchor; the
  # matching platform binary comes from this resource.
  livecheck do
    url "https://registry.npmjs.org/pnpm/next-12"
    strategy :json do |json|
      json["version"]
    end
  end

  resource "pnpm-native" do
    on_linux do
      on_arm do
        url "https://github.com/pnpm/pnpm/releases/download/v12.1.0/pnpm-linux-arm64.tar.gz"
        sha256 "24b202af01579ae885c8b3dc39a29c03d418a0c85eea274a969b216612abcd07"
      end
      on_intel do
        url "https://github.com/pnpm/pnpm/releases/download/v12.1.0/pnpm-linux-x64.tar.gz"
        sha256 "ef4c3e31c8f6e587c9f04ca4b42b63d47f331247930617304ffa63354c11db79"
      end
    end

    on_arm do
      url "https://github.com/pnpm/pnpm/releases/download/v12.1.0/pnpm-darwin-arm64.tar.gz"
      sha256 "927542783706b6966b6792f263b9b958dcd9909c5174965cd1aae0f4ab7f613c"
    end
    on_intel do
      url "https://github.com/pnpm/pnpm/releases/download/v12.1.0/pnpm-darwin-x64.tar.gz"
      sha256 "8e492591b982dc01bca49f4f3eb4a2f10d571f0c2e010b526a7cc49b584a46ed"
    end
  end

  def install
    resource("pnpm-native").stage do
      libexec.install "pnpm"
    end

    # Recreate the `pn`/`pnpx`/`pnx` aliases shipped in pnpm's npm package.
    (libexec/"pn").write <<~SH
      #!/bin/sh
      exec "#{libexec}/pnpm" "$@"
    SH
    (libexec/"pnpx").write <<~SH
      #!/bin/sh
      exec "#{libexec}/pnpm" dlx "$@"
    SH
    (libexec/"pnx").write <<~SH
      #!/bin/sh
      exec "#{libexec}/pnpm" dlx "$@"
    SH
    chmod 0755, [libexec/"pn", libexec/"pnpx", libexec/"pnx"]

    bin.install_symlink libexec/"pnpm", libexec/"pn", libexec/"pnpx", libexec/"pnx"

    generate_completions_from_executable(bin/"pnpm", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pnpm --version")
    system bin/"pnpm", "init"
    assert_path_exists testpath/"package.json", "package.json must exist"
  end
end
