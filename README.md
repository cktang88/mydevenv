# My dev env (MacOS only)

# TOOLING

- oxlint/oxfmt instead of eslint
- uv for python dep management (installed via Astral's standalone installer; supports `uv self update`)
- `pip` and `pipx` are aliased to `uv pip` / `uv tool` in `.zshrc`
- use [ast-grep](https://ast-grep.github.io/) (`sg`) instead of grep --> tell cursor/claude code to use this too...

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

Claude Code
---
- see [.claude](./.claude) for user memory
- `/loop 30m correct any ci errors for all my open prs` - scheduled task https://code.claude.com/docs/en/scheduled-tasks



Setup
---

[Mos](https://mos.caldis.me/) to fix 3rd party mouse scroll (speed + smooth anim)

```bash
git clone git@github.com:cktang88/mydevenv.git
cd mydevenv
chmod a+x ./install.sh
sudo ./install.sh
source ./install.sh #(can't simply execute script)
source ~/.cargo/env # update PATH for rust tooling
```

Useful things
---
- **swap [`] and [caps lock] keys** w Karabiner
- use **Arc Browser** :)
  - Chrome w/ React dev tools just for FE dev
- Cursor (replaces VSCode) - see [.cursorrules](https://github.com/cktang88/mydevenv/blob/master/.cursorrules)
- Warp (terminal)
- Everywhere: 
```
cmd+up/down --> scroll to top/bottom of page
cmd+x, cmd+v, cmd+c --> works on a whole line regardless of cursor position on a line if nothing selected
cmd + left/right --> move cursor to beginning/end of line
pg-up/pg-down = REALLY fast up/down scroll
    - [fn+up]/[fn+down] for mac
cmd+backspace = backspaces entire word/line depending on app (eg. MS Word backspaces entire word).

ctrl+left/right/up/down --> switch desktop, show all windows(up), show all windows of application(down)
```
- ctrl + ` = switch between windows of the SAME app
- ctrl + tab = switch between windows of all apps

Warp (replaces Iterm)

VSCode/Cursor extensions
---
- Git lens (shows git blame + has context menu option to copy remote URL)
- [jock.svg](https://marketplace.visualstudio.com/items?itemName=jock.svg) to preview SVGs
- open in Github: [sysoev.vscode-open-in-github](https://marketplace.visualstudio.com/items?itemName=sysoev.vscode-open-in-github)
- eslint (though ideally should use oxlint?)
- Material Icon Theme
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- Night Owl (syntax highlighting)

+ any lang specific mods

⚠️ NOTE: Set Changed Files view to TREE

eg. ![image](https://github.com/user-attachments/assets/51a7b596-6da2-4df6-8f46-ee3005fbd06d)



Zsh + mods
---
:fire: :fire: :fire: Run `install.sh`

How to install extensions - https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
- [colored-man-pages](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh)
- [fzf extension](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf) -- auto installed w/ `fzf`
- zoxide - https://github.com/ajeetdsouza/zoxide
- delta - good git diff https://github.com/dandavison/delta
