# My dev env (MacOS only)

# TOOLING

- oxlint instead of eslint
- uv and rye for python dep management
- use [ast-grep](https://ast-grep.github.io/) (`sg`) instead of grep --> tell cursor/claude code to use this too... 

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

Screen recording
---
- [Kap](https://github.com/wulkano/Kap) - for gif/mp4/various formats (MAC)

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


aliases
---

```bash
# custom

alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

alias fd="fdfind"
```
