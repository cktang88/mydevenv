# My dev env (MacOS only)

# TOOLING

- oxlint/oxfmt instead of eslint
- uv for python dep management (installed via Astral's standalone installer; supports `uv self update`)
- `pip` and `pipx` are aliased to `uv pip` / `uv tool` in `.zshrc`
- use [ast-grep](https://ast-grep.github.io/) (`sg`) instead of grep --> tell cursor/claude code to use this too...

Security
---

`install.sh` configures a **7-day minimum release age** on every package manager
that supports it natively. New malicious package versions are usually detected
and yanked within hours; a 7-day cooldown filters out the smash-and-grab class of
supply-chain attacks at near-zero cost.

| Tool    | File                       | Key                   | Unit    | Min version |
|---------|----------------------------|-----------------------|---------|-------------|
| npm     | `~/.npmrc`                 | `min-release-age`     | days    | 11.10.0     |
| pnpm    | user config (`pnpm config set ... --location=user`) | `minimumReleaseAge` | minutes | 10.16       |
| Yarn    | `~/.yarnrc.yml`            | `npmMinimalAgeGate`   | minutes | Berry 4.10  |
| Bun     | `~/.bunfig.toml [install]` | `minimumReleaseAge`   | seconds | 1.3         |
| uv      | `~/.config/uv/uv.toml`     | `exclude-newer`       | duration string (`"7 days"`) | 0.9.17 |
| pip     | `~/.config/pip/pip.conf`   | `install.uploaded-prior-to` | ISO 8601 (`P7D`) | 26.0 |

To bypass for a single install (use sparingly): pass `--min-release-age=0`,
`--ignore-minimum-release-age`, `--exclude-newer=now`, etc. — flag names vary by tool.

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
