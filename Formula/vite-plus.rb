class VitePlus < Formula
  desc "Unified web development toolchain and entry point (with Oxc native bindings)"
  homepage "https://viteplus.dev"
  url "https://github.com/voidzero-dev/vite-plus/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "5b53d5bf8941b5276434737e9ba0f89508a0ea6ad2871da6ab42459eb48b53c6"
  license "MIT"
  head "https://github.com/voidzero-dev/vite-plus.git", branch: "main"

  # Upstream homebrew-core bottles omit the Oxc native bindings (see `install`),
  # so this formula ships no bottle of its own until one is built locally:
  #   brew install --build-bottle arcadi4/tap/vite-plus
  #   brew install --build-from-source arcadi4/tap/vite-plus
  livecheck do
    url "https://api.github.com/repos/voidzero-dev/vite-plus/releases/latest"
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "just" => :build
  depends_on "pnpm" => :build
  depends_on "rustup" => :build # TODO: try to restore stable rust: https://github.com/voidzero-dev/vite-task/commit/db99ba4d5d33323cc9e7b329f11bdea0610fbc7f
  depends_on "node"

  resource "rolldown" do
    url "https://github.com/rolldown/rolldown.git",
        revision: "5b4746e442989d770c606ce08d2737e6aafbd25d"
    version "5b4746e442989d770c606ce08d2737e6aafbd25d"

    livecheck do
      url "https://raw.githubusercontent.com/voidzero-dev/vite-plus/refs/tags/v#{LATEST_VERSION}/packages/tools/.upstream-versions.json"
      strategy :json do |json|
        json.dig("rolldown", "hash")
      end
    end
  end

  resource "vite" do
    url "https://github.com/vitejs/vite.git",
        revision: "434e8e9495436a60789f2b588a04a6a24a3d1661"
    version "434e8e9495436a60789f2b588a04a6a24a3d1661"

    livecheck do
      url "https://raw.githubusercontent.com/voidzero-dev/vite-plus/refs/tags/v#{LATEST_VERSION}/packages/tools/.upstream-versions.json"
      strategy :json do |json|
        json.dig("vite", "hash")
      end
    end
  end

  # oxfmt, oxlint and oxlint-tsgolint ship their prebuilt platform binaries as
  # optionalDependencies (e.g. @oxfmt/binding-darwin-arm64). The napi-rs loaders
  # in those packages resolve a binding at require time and throw
  # "Cannot find native binding" when none is present, which takes out every
  # Oxc-backed command: `vp fmt`, `vp lint`, `vp check`, `vp migrate`.
  #
  # Upstream homebrew-core deploys with `--no-optional`, which strips exactly
  # those packages while leaving their JS parents installed. The result is a
  # `vp` binary that answers `--version` and then dies on first real use.
  #
  # Dropping the flag is the root-cause fix: pnpm already filters optional
  # dependencies by os/cpu, so it installs the one binding matching the build
  # machine and no others. Bottles stay lean and every platform is handled by
  # the package manager rather than by a hand-maintained arch mapping.
  #
  # The `rm_r ... fsevents` below is dead code while `--no-optional` is passed,
  # since fsevents is itself an optional dependency. That is the tell that the
  # flag was added after the fact and took the Oxc bindings with it.
  def install
    resource("rolldown").stage buildpath/"rolldown"
    resource("vite").stage buildpath/"vite"

    # Build with Homebrew pnpm. The staged resources pin their own versions too
    %w[package.json rolldown/package.json vite/package.json].each do |file|
      package_json = buildpath/file
      package_json.atomic_write(JSON.pretty_generate(JSON.parse(package_json.read).except("packageManager")))
    end

    # Vite patches only build-time dependencies, which the production deploy below omits
    (buildpath/"pnpm-workspace.yaml").append_lines "allowUnusedPatches: true"

    system "just", "build"
    system "cargo", "install", *std_cargo_args(path: "crates/vp_global_cli")

    # NOTE: no --no-optional here. See the comment above this method.
    system "pnpm", "--filter=vite-plus", "deploy", "--prod", "--legacy",
           prefix/"node_modules/vite-plus"
    node_modules = prefix/"node_modules/vite-plus/node_modules"
    # Remove incompatible pre-built `bare-*` binaries. Recurse as `deploy --legacy` writes
    # both the legacy `<name>@<version>` and the current `@/<name>/<version>/<hash>` layouts
    os = OS.kernel_name.downcase
    arch = Hardware::CPU.intel? ? "x64" : Hardware::CPU.arch.to_s
    node_modules.glob(".pnpm/**/prebuilds/*")
                .each { |dir| rm_r(dir) if dir.basename.to_s != "#{os}-#{arch}" }
    rm_r node_modules.glob(".pnpm/**/node_modules/fsevents")

    # Symlink vp to vpr and vpx. These are detected at runtime by argv[0]
    bin.install_symlink bin/"vp" => "vpr"
    bin.install_symlink bin/"vp" => "vpx"

    # Generate shell completions, vp uses clap but with a custom env var so we can't use our helper
    (bash_completion/"vp").write Utils.safe_popen_read({ "VP_COMPLETE" => "bash" }, bin/"vp")
    (fish_completion/"vp.fish").write Utils.safe_popen_read({ "VP_COMPLETE" => "fish" }, bin/"vp")
    (zsh_completion/"_vp").write Utils.safe_popen_read({ "VP_COMPLETE" => "zsh" }, bin/"vp")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vp --version")

    # Regression guard for the missing-native-bindings bug. `vp --version` only
    # exercises the Rust binary and passes even when the Oxc toolchain is
    # unusable, so assert the platform bindings were actually deployed and
    # that they load. The store layout is .pnpm/@<scope>+<name>@<version>.
    pnpm = prefix/"node_modules/vite-plus/node_modules/.pnpm"

    refute_empty pnpm.glob("@oxfmt+binding-*"),
                 "no @oxfmt/binding-* deployed; was --no-optional reintroduced?"

    %w[oxfmt oxlint].each do |pkg|
      dir = pnpm.glob("#{pkg}@*/node_modules/#{pkg}").first
      refute_nil dir, "#{pkg} was not deployed"
      assert system("node", "-e", "require('#{dir}')"),
             "#{pkg} native binding failed to load"
    end

    # `vp` calls `tcsetattr` on a tty stdin, which stops it with SIGTTOU on the test PTY
    system "#{bin}/vp create vite:application --no-interactive --directory test-app < /dev/null"
    assert_path_exists testpath/"test-app/package.json"

    cd testpath/"test-app" do
      output = shell_output("#{bin}/vp fmt < /dev/null")
      assert_match "Finished", output
    end
  end
end
