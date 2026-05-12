---
name: homebrew-casks
description: Use when creating, updating, reviewing, or troubleshooting Homebrew Cask definitions in a tap, especially when GitHub release assets, cask audit/style failures, local tap testing, or macOS-only dependencies are involved.
---

# Homebrew Casks

## Overview

Homebrew casks are only done when Homebrew can parse, audit, fetch, and dry-run install them from a tap. Do not stop at a syntactically plausible Ruby file.

## When to Use

Use this skill for:

- Adding a new file under `Casks/*.rb`.
- Updating a cask version, checksum, URL, app artifact, or `livecheck`.
- Debugging `brew audit --cask`, `brew style --cask`, `brew fetch --cask`, or local tap failures.
- Packaging macOS GUI apps, `.dmg`, `.zip`, `.pkg`, architecture-specific downloads, or GitHub release assets.

Do not use it for formulae in `Formula/*.rb`; use formula-specific guidance instead.

## Workflow

1. Inspect the tap first: `git status --short`, existing `Casks/*.rb`, and README/index conventions. Do not overwrite unrelated dirty work.
2. Resolve upstream metadata from an authoritative source. For GitHub releases, prefer `gh release view --repo OWNER/REPO --json tagName,assets,url,isLatest,publishedAt` or `gh api repos/OWNER/REPO/releases/latest`.
3. Choose the user-facing asset, not debug symbols or source archives. For app casks, confirm the staged artifact path (`app "Name.app"`) by inspecting or mounting the archive when uncertain.
4. Verify the SHA-256 from the downloaded bytes or trusted release asset digest. Use `sha256 :no_check` only when upstream cannot provide stable bytes for a version.
5. Write the cask in Homebrew stanza order and keep it minimal.
6. Update README/index tables if the tap maintains them.
7. Verify through Homebrew from a tap name, not only through Ruby syntax.

## Cask Shape

Use the documented stanza order and blank-line grouping:

```ruby
cask "token" do
  version "1.2.3"
  sha256 "..."

  url "https://example.com/downloads/App-#{version}.dmg"
  name "App"
  desc "Short functional description"
  homepage "https://example.com/app"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "App.app"
end
```

Adjust only what the artifact needs: `on_arm`/`on_intel`, `pkg` plus `uninstall`, `binary`, `suite`, `container`, `zap`, or `caveats`.

## Rules That Prevent Common Failures

| Topic | Rule |
| --- | --- |
| `desc` | Less than 80 characters, starts uppercase, describes function, no app name, vendor, pronouns, marketing, or “for macOS”. |
| `verified:` | Add only when `url` and `homepage` domains differ. Use the smallest stable URL prefix proving the vendor/app. Do not add it for same-domain GitHub homepage and release URLs. |
| macOS-only casks | If audit/style requires marking platform but upstream minimum is below Homebrew's supported symbols, use `depends_on :macos`. Do not force disabled symbols like `:mojave`. |
| minimum macOS | Use `depends_on macos: :sonoma` or `">= :sonoma"` only for currently supported Homebrew macOS symbols. If Homebrew rejects an old symbol, do not encode it. |
| GitHub release assets | Use `strategy :github_releases` for normal releases unless the project needs a custom regex or latest-only behavior. |
| local paths | Current Homebrew rejects raw cask path audit/install in many flows. Do not verify as `brew audit --cask Casks/token.rb` or `brew install --cask ./Casks/token.rb`; test by cask token from a tap. |
| temp taps | `brew tap user/name /path` may clone committed HEAD, not uncommitted files. If you cannot commit yet, sync or copy the working cask into `$(brew --prefix)/Library/Taps/user/homebrew-name/Casks/` before testing. |

## Verification Gate

Run the strongest applicable commands. Prefer fully-qualified tokens for personal taps. Do not consider `brew audit --cask` alone sufficient; `brew fetch --cask` and `brew install --cask --dry-run` are part of the completion gate.

```sh
ruby -c Casks/token.rb
brew style --cask user/tap/token
brew audit --cask --online user/tap/token
brew info --cask --json=v2 user/tap/token
brew fetch --cask user/tap/token
brew install --cask --dry-run user/tap/token
```

For local tap testing, reduce Homebrew API/update interference:

```sh
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_FROM_API=1
```

Manual QA is the Homebrew surface: Homebrew must read the cask metadata, fetch/verify the artifact, and dry-run the install artifact. If you skip a command because it is unsafe, too large, or blocked, state exactly which command and why.

## Failure Recovery

When Homebrew rejects the cask, trust the Homebrew error over assumptions from examples. Fix the DSL and rerun the failing command. Known traps include unnecessary `verified:`, platform words in `desc`, disabled old macOS symbols, and testing an uncommitted cask through a tap clone that cannot see it.
