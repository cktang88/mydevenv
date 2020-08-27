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

Theming
---
- [Papirus icons](https://www.xfce-look.org/p/1166289/)
- Numix + Adwaita mix


Useful things
---
- **swap [ctrl/cmd] and [caps lock] keys**
- use Firefox Sync
- VSCode: split 2 screen
- Iterm: Tmux integration (usually binary partition -> 1x1/2, 1x1/4, 2x1/8)
    - use `tmux -CC new -A -s main` from [here](https://gitlab.com/gnachman/iterm2/-/wikis/tmux-Integration-Best-Practices#what-tmux-command-should-i-use)
- Chrome: redux dev tools, react dev tools, cmd+left/right = forward/backward page navigation
- Everywhere: 
```
cmd+up/down --> scroll to top/bottom of page
cmd+x, cmd+v, cmd+c --> works on a whole line regardless of cursor position on a line if nothing selected
cmd + left/right --> move cursor to beginning/end of line
pg-up/pg-down = REALLY fast up/down scroll
    - [fn+up]/[fn+down] for mac

ctrl+left/right/up/down --> switch desktop, show all windows(up), show all windows of application(down)
```

- Laptop proper sleep - https://askubuntu.com/questions/839587/xubuntu-16-10-wont-wake-up-correctly-after-opening-lid

Misc software for Linux
---
- [clamAv](https://www.clamav.net/documents/installation-on-debian-and-ubuntu-linux-distributions)
- [keepass2](https://packages.debian.org/sid/keepass2) - install via `apt`
- **[Albert launcher](https://software.opensuse.org//download.html?project=home%3Amanuelschneid3r&package=albert)** - use [./.albertignore](./.albertignore) file
  - add `text/*` to indexed mimetypes so it can find src code files
- **[Fusuma](https://github.com/iberianpig/fusuma)** - to customize gestures for Mac-like settings - see [this](https://medium.com/@dgviranmalaka/how-to-enhance-touch-pad-gestures-like-mac-in-ubuntu-18-04-laptop-f5f25d5a0b4f) and [also this](https://dev.to/iberianpig/how-to-install-and-customize-fusuma-73l)
  - fusuma config in this repo, should auto setup in `install.sh`
  - NOTE: need to use `sudo ~/.rbenv/shims/fusuma -d` to start (the path is from `which fusuma`, the `-d` for detached), should add to autostart scripts
- [Redshift](http://jonls.dk/redshift/)
- PulseAudio - change the default `/etc/pulse/daemon.conf` to use more CPU to get higher audio quality (see `daemon.conf` file)
- Firefox - change DPI - change ` layout.css.devPixelsPerPx` in `about:config` to 1.2ish
- [Terminator](https://terminator-gtk3.readthedocs.io/en/latest/) - allows multiple panes per tab

Misc software for Mac
---
- [Kap](https://github.com/wulkano/Kap) - for gif/screenrecording

Iterm
---
TODO:
- Preferences > Profiles > Keys > set `Natural Text Editing` preset
- set color scheme to Pastel, turn off bold
- set confirm to close tab

VSCode extensions
---
- Git lens
- open in Github: [sysoev.vscode-open-in-github](https://marketplace.visualstudio.com/items?itemName=sysoev.vscode-open-in-github)
- eslint
- output colorizer
- path intellisense
- Material Icon Theme
- ~visual studio intellicode~ [tabNine](https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- Night Owl (syntax highlighting)

Only if used:
- jest
- jest runner
- elixir
- go

**ALSO: Use [Pylance](https://devblogs.microsoft.com/python/announcing-pylance-fast-feature-rich-language-support-for-python-in-visual-studio-code/)** and maybe pylint/flake8 for python

VSCode useful keybindings
---

### default

```
cmd+b = toggle sidebar visibility (default hidden)
shift+alt+right = expand bracket selection (shift+alt+left to contract)
ctrl+g = goto line #
*** shortcuts for [select to start of line] and [select to end of line]
```

### custom
```
cmd+option+J = toggle "workbench.action.toggleMaximizedPanel"
```

Zsh + mods
---
:fire: :fire: :fire: Run `install.sh`

How to install extensions - https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
- Zsh autocorrect enabled default
- [colored-man-pages](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh)
- [fzf extension](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf) -- auto installed w/ `fzf`
- [fasd extension](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fasd)


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

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias z='fasd_cd -d'     # cd, same as z,j,autojump

# from fasd zsh plugin
alias v='fasd -f -e "$EDITOR"'
alias o="fasd -a -e xdg-open"
alias j="fasd_cd -d -i"
```
