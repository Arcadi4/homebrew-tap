class PnpmAT12 < Formula
  desc "Fast, disk space efficient package manager"
  homepage "https://pnpm.io/"
  url "https://registry.npmjs.org/pnpm/-/pnpm-12.0.0-rc.11.tgz"
  sha256 "5bbd5408a4e09f99fa39bc79d7a1fc8aa65b2cc45af1b889ec6ec7e762f8e75b"
  license "MIT"

  # pnpm 12 is a native (Rust) binary, distributed per platform as a GitHub
  # release asset. The npm package is only used here as the version anchor; the
  # matching platform binary comes from this resource.
  # Track the 12.x line (including release candidates until a stable 12.0.0
  # exists) via the npm `next-12` dist-tag.
  livecheck do
    url "https://registry.npmjs.org/pnpm/next-12"
    strategy :json do |json|
      json["version"]
    end
  end

  resource "pnpm-native" do
    on_linux do
      on_arm do
        url "https://github.com/pnpm/pnpm/releases/download/v12.0.0-rc.11/pnpm-linux-arm64.tar.gz"
        sha256 "9d5da4c2a9b4a420c892fa35f0852af93538d84ef9af40f8484185b77ada044e"
      end
      on_intel do
        url "https://github.com/pnpm/pnpm/releases/download/v12.0.0-rc.11/pnpm-linux-x64.tar.gz"
        sha256 "bf99e0c3df1a989e62bd4bed1401786997333981a54476859ec36f0ef82ebb8a"
      end
    end

    on_arm do
      url "https://github.com/pnpm/pnpm/releases/download/v12.0.0-rc.11/pnpm-darwin-arm64.tar.gz"
      sha256 "11bcfacf33dd8c9f8859acb374a6a4c380213a63ce2d5be4d7c4a455e3f0710d"
    end
    on_intel do
      url "https://github.com/pnpm/pnpm/releases/download/v12.0.0-rc.11/pnpm-darwin-x64.tar.gz"
      sha256 "6c601ecee8e70a14fde1872dbbcc0d0df4ec1d7079154b0878947ee7525c986b"
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

  def caveats
    <<~EOS
      pnpm 12 is currently in pre-release; this formula tracks the latest 12.x
      release candidate (now #{version}).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pnpm --version")
    system bin/"pnpm", "init"
    assert_path_exists testpath/"package.json", "package.json must exist"
  end
end
