#!/bin/bash

########################################################
# Run this script with sudo permissions
########################################################

set -o verbose #echo commands

apt update

# install zsh
if ! command -v zsh; then
  apt install zsh -y
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy .zshrc
cp ./.zshrc ~/.zshrc
source ~/.zshrc

# to support new vim
apt install vim-gui-common
cp ./.vimrc ~/.vimrc

# append delta config to git config
cat ./.gitconfig >> ~/.gitconfig

# copy .albertignore and tmux and redshift
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  cp .albertignore ~/.albertignore
  cp .tmux.conf ~/.tmux.conf
  apt install tmux
  apt install redshift redshift-gtk
fi

# Adds necessary packages
apt install curl build-essential checkinstall libssl-dev

# Install NodeJS+NPM, https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions-enterprise-linux-fedora-and-snap-packages
if ! command -v node; then
  curl -sL https://deb.nodesource.com/setup_19.x | bash -
  apt install -y nodejs
fi

# install Rust, https://www.rust-lang.org/tools/install
if ! command -v rustc; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.cargo/env
fi

# install Ruby
if ! command -v ruby; then
  apt install -y ruby
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Set up FUSUMA for multi-touch gestures
  if ! command -v fusuma; then
    apt install libinput-tools xdotool
    gem install fusuma
  fi
  mkdir -p ~/.config/fusuma # only creates if dir doesn't already exist
  cp ./fusuma/config.yml ~/.config/fusuma/config.yml

  # Add sound controls
  apt install pavucontrol xfce4-pulseaudio-plugin

  # Add terminator
  add-apt-repository ppa:gnome-terminator
  apt update
  apt install terminator

  # Add xfce4-goodies (includes whisker menu)
  if [[ $(ps -e | grep -E -i "xfce4") ]]; then
    apt install xfce4-goodies
  fi
fi

########################################################
# XFCE Themeing
########################################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [[ $(ps -e | grep -E -i "xfce4") ]]; then
    # Adwaita xfce theme
    xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
    # papirus dark icons
    wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"

    # set window manager theme to Numix
    xfconf-query -c xfwm4 -p /general/theme -s "Numix"
  fi
fi

#################################m#######################
# Improved tooling
########################################################

# NodeJS version manager, https://github.com/tj/n (see also: https://github.com/tj/n#third-party-installers)
npm i -g n
n latest

# tldr: improved 'man', https://github.com/tldr-pages/tldr
npm i -g tldr

# exa: improved 'ls', https://github.com/ogham/exa
cargo install exa --locked

# zoxide: improved cd
cargo install zoxide --locked

# install delta
cargo install git-delta --locked

# bat: improved 'cat', https://github.com/sharkdp/bat
cargo install bat --locked

# fzf: fuzzy finder, https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ripgrep: improved 'grep', https://github.com/BurntSushi/ripgrep
cargo install ripgrep --locked

# fd: improved 'find', https://github.com/sharkdp/fd/ 
# (note: binary is named `fdfind`, aliased to `fd` in .zshrc)

# httpie: improved 'curl', https://github.com/jakubroztocil/httpie/


if [[ "$OSTYPE" == "linux-gnu" ]]; then
  apt install -y fd-find httpie
fi

########################################################
# Set default shell as zsh
########################################################

chsh -s $(which zsh)

set +o verbose # echo commands off
