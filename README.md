# My dev env
Setup
---

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
- **swap [`] and [caps lock] keys**
- use **Arc Browser** :)
  - Chrome w/ React dev tools just for FE dev
- Cursor (replaces VSCode)
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
- Mac: ctrl + ` = switch between windows of the SAME app
    - ctrl + tab = switch between windows of all apps

- Laptop proper sleep - https://askubuntu.com/questions/839587/xubuntu-16-10-wont-wake-up-correctly-after-opening-lid

Screen recording
---
- [Kap](https://github.com/wulkano/Kap) - for gif/mp4/various formats (MAC)
- [Peek](https://github.com/phw/peek) - gif mostly, can also do mp4 (LINUX)
- [Kazam](https://itsfoss.com/kazam-screen-recorder/) - mp4 (LINUX)

Iterm
---
TODO:
- Preferences > Profiles > Keys > set `Natural Text Editing` preset
- Preferences > Profiles > Terminal > set `Scrollback lines` to 5000 (default 1000)
- Pastel color preset, turn off "brighten bold"
- set confirm to close tab in Sessions

VSCode/Cursor extensions
---
- Git lens (comes w/ context menu option to copy remote URL)
- [jock.svg](https://marketplace.visualstudio.com/items?itemName=jock.svg) to preview SVGs
- open in Github: [sysoev.vscode-open-in-github](https://marketplace.visualstudio.com/items?itemName=sysoev.vscode-open-in-github)
- eslint
- output colorizer
- path intellisense
- Material Icon Theme
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- Night Owl (syntax highlighting)

Lang-specific:
- vitest
- elixir
- go
- python


VSCode useful keybindings
---

### default

```
cmd+b = toggle sidebar visibility (default hidden)
ctrl+g = goto line #
*** shortcuts for [select to start of line] and [select to end of line]
```


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
alias ff="firefox"
alias tn="thunar"

alias sai="sudo apt install"
alias sau="sudo apt update"

alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

alias fd="fdfind"
```

(Linux) Theming
---
- [Papirus icons](https://www.xfce-look.org/p/1166289/)
- Numix + Adwaita mix

(Linux) Misc Software
---
- [keepass2](https://packages.debian.org/sid/keepass2) - install via `apt`
- **[Albert launcher](https://software.opensuse.org//download.html?project=home%3Amanuelschneid3r&package=albert)** - use [./.albertignore](./.albertignore) file
  - add `text/*` to indexed mimetypes so it can find src code files
- **[Fusuma](https://github.com/iberianpig/fusuma)** - to customize gestures for Mac-like settings - see [this](https://medium.com/@dgviranmalaka/how-to-enhance-touch-pad-gestures-like-mac-in-ubuntu-18-04-laptop-f5f25d5a0b4f) and [also this](https://dev.to/iberianpig/how-to-install-and-customize-fusuma-73l)
  - fusuma config in this repo, should auto setup in `install.sh`
  - NOTE: need to use `sudo ~/.rbenv/shims/fusuma -d` to start (the path is from `which fusuma`, the `-d` for detached), should add to autostart scripts
- [Redshift](http://jonls.dk/redshift/) - config in `./.config/redshift.conf`
    - [does NOT work on Wayland](https://github.com/jonls/redshift#why-doesnt-redshift-work-on-wayland-eg-fedora-25)
- PulseAudio - change the default `/etc/pulse/daemon.conf` to use more CPU to get higher audio quality (see `daemon.conf` file)
- [Terminator](https://terminator-gtk3.readthedocs.io/en/latest/) - allows multiple panes per tab
