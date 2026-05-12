---
name: homebrew-auto-update-workflow
description: Use when adding, updating, or reviewing GitHub Actions workflows that automatically bump Homebrew casks from upstream release metadata, especially GitHub release assets, checksums, scheduled runs, workflow_dispatch, or bot commits.
---

# Homebrew Auto-Update Workflow

## Overview

An auto-update workflow is an unattended cask packager. It is only correct when it selects the exact artifact the cask installs, proves the checksum, mutates the cask fail-fast, and verifies through Homebrew.

## When to Use

Use this for `update-*-cask.yml` workflows, GitHub Releases assets, scheduled cask bumps, manual `workflow_dispatch` updates, multi-architecture casks, asset digests, bot commits, or suspicious release assets like `dSYM`, source archives, and debug zips.

Do not use it as-is for formulae; adapt the source metadata and verification gates.

## Quick Reference

| Area | Rule |
| --- | --- |
| Inspect first | Run `git status --short`; read the cask, nearby workflows, and upstream release asset names before copying anything. |
| Triggers | Use `workflow_dispatch` plus a staggered `schedule`; scheduled runs execute on the default branch. |
| Permissions | Set `permissions: contents: write` only when the workflow pushes commits. |
| Checkout | Use `actions/checkout@v4` or newer with `fetch-depth: 0`; keep one push strategy. |
| Metadata | Prefer `gh api repos/OWNER/REPO/releases` with `GH_TOKEN: ${{ github.token }}` and write step outputs to `$GITHUB_OUTPUT`. |
| Homebrew bump commands | If using `brew bump` or `brew bump-cask-pr` instead of manual edits, use a macOS runner, `HOMEBREW_DEVELOPER=1`, and a PAT with needed repo/workflow scope. Do not mix this with the manual-edit pattern. |
| Asset choice | Match exact user-facing asset names whenever possible. Avoid loose regexes like "any `.dmg` except dSYM" unless exact names are impossible and the regex is tested against real assets. Never pick source archives, `.dSYM.zip`, or debug symbols. |
| Checksum | Prefer trusted release asset `.digest` with `sha256:` prefix. If no digest exists, download the selected asset and hash bytes. Do not use `sha256 :no_check` when stable bytes exist. |
| Mutation | Use Ruby `sub!`/`gsub!` with `|| abort(...)`; update `on_arm` and `on_intel` blocks separately. Strip leading `v` from tags when the cask version should not include it. |
| No-op runs | Use `git diff --quiet -- Casks/token.rb` and skip commit when unchanged. |
| Commit | Configure `github-actions[bot]`; commit `Bump token to ${VERSION}`; push with the checked-out credentials or token URL, not both. |

## Workflow Shape

```yaml
on:
  workflow_dispatch:
  schedule:
    - cron: "15 7,22 * * *"

permissions:
  contents: write

jobs:
  update-cask:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: Homebrew/actions/setup-homebrew@main
      - id: release
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          set -euo pipefail
          gh api repos/OWNER/REPO/releases > releases.json
          tag="$(jq -r 'map(select(.draft == false and any(.assets[]; .name == "App.dmg")))[0].tag_name' releases.json)"
          version="${tag#v}"
          digest="$(jq -r --arg tag "$tag" '.[] | select(.tag_name == $tag) | .assets[] | select(.name == "App.dmg") | .digest // empty' releases.json)"
          [[ "$digest" == sha256:* ]] || { echo "missing sha256 digest" >&2; exit 1; }
          echo "version=$version" >> "$GITHUB_OUTPUT"
          echo "sha256=${digest#sha256:}" >> "$GITHUB_OUTPUT"
```

Pair this with a Ruby update step that aborts on every missing pattern, then audit, check changes, commit, and push only when changed.

## Verification Gate

Before claiming the workflow works, run the strongest applicable checks:

```sh
actionlint .github/workflows/update-token-cask.yml
ruby -e 'require "yaml"; YAML.load_file(".github/workflows/update-token-cask.yml")'
ruby -c Casks/token.rb
brew style --cask user/tap/token
brew audit --cask --online user/tap/token
brew info --cask --json=v2 user/tap/token
brew fetch --cask user/tap/token
brew install --cask --dry-run user/tap/token
```

Also simulate the metadata and Ruby mutation against a temporary cask copy. Manual QA is the workflow surface plus the Homebrew surface: prove the selected release would update the cask, and prove Homebrew can read, fetch, and dry-run the result.

These are red flags, not substitutes:

- `brew style --cask Casks/token.rb`, `brew audit --cask Casks/token.rb`, or `brew install --cask ./Casks/token.rb`; verify by tap token instead.
- `brew bump-cask-pr --dry-run` as the only install check; it does not replace `brew fetch` and `brew install --cask --dry-run`.
- A verification list that stops before dry-run install.

## Common Mistakes

| Mistake | Fix |
| --- | --- |
| Copying the nearest workflow and only renaming files | Re-read the target cask URL, release tags, asset names, and architecture blocks. |
| Selecting `App.app.dSYM.zip` or source archives | Match the artifact installed by `app`, `pkg`, `binary`, or `suite`. |
| Trusting the first `.dmg` | Use an exact name, or document and test the regex. |
| Verifying with local paths | Replace raw file checks with tap-token commands: `brew style --cask user/tap/token`, `brew audit --cask --online user/tap/token`, `brew fetch --cask user/tap/token`, and `brew install --cask --dry-run user/tap/token`. |
| Using unguarded `text.sub!` | Append `|| abort("Could not update ...")` to every mutation. |
| Forgetting tag normalization | Use `version="${tag#v}"` unless the cask intentionally includes `v`. |
| Stopping at `brew audit` | Fetch and dry-run install too. |
| Leaving temp files like `releases.json` | Delete them or keep them untracked before finishing. |
