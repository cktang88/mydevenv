# My dev env

**macOS only.** The installer assumes Homebrew (and installs it if missing) and
uses macOS conventions throughout. Linux users: fork it and swap brew for apt.

Quick start:

```bash
git clone git@github.com:cktang88/mydevenv.git
cd mydevenv
./install.sh         # NO sudo — brew refuses sudo, everything is user-scoped
```

Re-run `install.sh` any time after editing `configs/*` to reapply the global
package-manager configs. Existing files are backed up before overwrite.

# TOOLING

Installed by `install.sh`:

- **CLI** via brew: `node`, `vim`, `git`, `gh`, `ripgrep`, `zoxide`, `fzf`,
  `tldr`, `jq`, `ast-grep`
- **AI coding agent**: `claude-code` via Anthropic's native installer
  (`curl -fsSL https://claude.ai/install.sh | bash`)
- **JS package managers**: `pnpm@latest` + `yarn@stable` via corepack;
  `bun` via the official curl installer
- **Python**: `uv` via Astral's standalone installer (supports `uv self update`);
  `pip` bumped to ≥ 26.0
- **Shell**: oh-my-zsh + `zsh-autosuggestions` + `zsh-syntax-highlighting`

Notes:

- Use [ast-grep](https://ast-grep.github.io/) (`sg`) instead of grep — tell
  Cursor / Claude Code to use it too
- `pip` and `pipx` are aliased to `uv pip` / `uv tool` in `.zshrc`
- oxlint/oxfmt are preferred over eslint (not installed globally — per-project)

Security
---

`install.sh` copies hardened global configs from [`./configs/`](./configs) into
your home dir. Edit the files in `configs/` and re-run `install.sh` to reapply;
existing global configs are backed up before overwrite.

**What's enforced**

| Concern | Mechanism | Tools |
|---|---|---|
| 7-day min release age (supply-chain cooldown) | refuse install of versions younger than the cutoff | npm, pnpm, yarn, bun, uv, pip |
| Lifecycle scripts blocked | no `postinstall` / `preinstall` code execution | npm (`ignore-scripts`), yarn (`enableScripts: false`), bun (`ignoreScripts=true` — overrides Bun's top-500 trusted list), pnpm (default since v10) |
| Lockfile-poisoning protection | re-resolve lockfile against the registry | yarn `enableHardenedMode: true` |
| Dependency-confusion defense | with multiple indexes, never fall back to PyPI for an internal name | uv `index-strategy="first-index"` (explicit pin of default) |
| Registry pinning | prevent env/config from silently redirecting installs | bun `registry="https://registry.npmjs.org/"` |
| Diffable lockfiles | reviewable in PRs | bun `saveTextLockfile=true` |
| Audit gate | `npm audit` only fails on high/critical | npm `audit-level=high` |
| Reproducibility | exact-version pinning | npm `save-exact=true`, bun `exact=true` |
| Forbid system-wide Python installs | refuse pip outside a venv | pip `require-virtualenv=true` |

**Why 7 days:** new malicious package versions are typically detected and yanked
within hours. A 7-day cooldown filters out the smash-and-grab class of
supply-chain attacks at near-zero cost.

**Why block lifecycle scripts:** `postinstall` runs arbitrary code during
`npm install`. A compromised transitive dep can pwn your dev machine without you
even importing it. Re-enable per-project when needed (npm: `--foreground-scripts`
or `@lavamoat/allow-scripts`; yarn: `dependenciesMeta`; bun: `trustedDependencies`).

**Bypass for one install** (use sparingly): flag names vary —
`--ignore-scripts=false`, `--min-release-age=0`, `--exclude-newer=now`, etc.

**Required versions:** npm ≥ 11.10.0, pnpm ≥ 10.16, yarn ≥ Berry 4.10, bun ≥ 1.3,
uv ≥ 0.9.17, pip ≥ 26.0.

**Shell + Homebrew hardening** (already applied by `.zshrc` from `install.sh`):

- `HOMEBREW_NO_ANALYTICS=1` — kill telemetry
- `HOMEBREW_NO_INSECURE_REDIRECT=1` — refuse insecure HTTP redirects during downloads
- `HOMEBREW_CASK_OPTS=--require-sha` — warn on casks with `sha256 :no_check`
- `setopt HIST_IGNORE_SPACE` — prefix a command with a space to keep it out of shell history (handy for `MY_TOKEN=… cmd`)
- `chmod 600 ~/.zsh_history` — history file readable only by you

**Optional macOS system hardening:**

```bash
sudo ./macos-harden.sh
```

Turns on the firewall + stealth mode, requires password immediately on
sleep/screensaver, disables Power Nap, and tightens a few Finder defaults.
Idempotent; reversible via the same commands with opposite values.
Review the file before running on a machine you didn't set up.

Claude Code
---
- see [.claude](./.claude) for user memory
- `/loop 30m correct any ci errors for all my open prs` - scheduled task https://code.claude.com/docs/en/scheduled-tasks



macOS apps (manual)
---

Not installed by the script:

- [Mos](https://mos.caldis.me/) — 3rd-party mouse scroll fix (smooth + speed)
- [Karbiner-Elements](https://karabiner-elements.pqrs.org/) — for the
  `` ` `` ↔ caps-lock swap
- [Arc Browser](https://arc.net/) (Chrome with React DevTools for FE work)
- [Cursor](https://cursor.sh/) — see [.cursorrules](./.cursorrules)
- [Warp](https://warp.dev/) terminal
- [Codex app](https://developers.openai.com/codex/app) — OpenAI's coding agent
  (download the GUI app rather than the CLI)

macOS keyboard shortcuts
---

```
cmd + up/down            scroll to top/bottom of page
cmd + left/right         move cursor to beginning/end of line
cmd + x/v/c              works on the whole line if nothing is selected
cmd + backspace          delete entire word/line (varies by app)
fn  + up/down            page-up/page-down (very fast scroll)
ctrl + left/right        switch desktop
ctrl + up                show all windows
ctrl + down              show all windows of the current app
ctrl + `                 switch between windows of the SAME app
ctrl + tab               switch between apps
```

VSCode / Cursor extensions
---

- Git Lens — git blame + "copy remote URL" context menu
- [jock.svg](https://marketplace.visualstudio.com/items?itemName=jock.svg) — preview SVGs
- [sysoev.vscode-open-in-github](https://marketplace.visualstudio.com/items?itemName=sysoev.vscode-open-in-github)
- Material Icon Theme
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- Night Owl (syntax highlighting)

⚠️ Set "Changed Files" view to **tree**.
