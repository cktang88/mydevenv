# My dev env
Setup
---
1. clone this dir
2. 
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
- VSCode: split 2 screen
- Iterm: split 2 screen/panels
- Chrome: redux dev tools, react dev tools, cmd+left/right = forward/backward page navigation, cmd+L = addr bar highlight
- Everywhere: cmd+up/down to scroll to top/bottom of page, fn+up/down to scroll fast

Misc software for Linux
---
- [clamAv](https://www.clamav.net/documents/installation-on-debian-and-ubuntu-linux-distributions)
- [keepass2](https://packages.debian.org/sid/keepass2) - install via `apt`
- **[Albert launcher](https://github.com/albertlauncher/albert)** - use [./.albertignore](./.albertignore) file
  - add `text/*` to indexed mimetypes so it can find src code files
- **[Fusuma](https://github.com/iberianpig/fusuma)** - to customize gestures for Mac-like settings - see [this](https://medium.com/@dgviranmalaka/how-to-enhance-touch-pad-gestures-like-mac-in-ubuntu-18-04-laptop-f5f25d5a0b4f) and [also this](https://dev.to/iberianpig/how-to-install-and-customize-fusuma-73l)
  - fusuma config in this repo, should auto setup in `install.sh`
  - NOTE: need to use `sudo ~/.rbenv/shims/fusuma -d` to start (the path is from `which fusuma`, the `-d` for detached), should add to autostart scripts

- [Redshift](http://jonls.dk/redshift/)
- PulseAudio - change the default `/etc/pulse/daemon.conf` to use more CPU to get higher audio quality (see `daemon.conf` file)

Iterm
---
TODO:
- Preferences > Profiles > Keys > set `Natural Text Editing` preset
- set color scheme to Pastel, turn off bold
- set confirm to close tab

VSCode extensions
---
- eslint
- go
- jest
- jest runner
- night owl
- output colorizer
- path intellisense
- tslint
- visual studio intellicode

VSCode useful keybindings
---

### default

...

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
- custom aliases:
```
alias fp="featherpad"
alias ff="firefox"
alias tn="thunar"
```
