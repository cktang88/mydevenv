#!/bin/bash

########################################################
# Run this script with sudo permissions
########################################################

set -x #echo on

# install zsh
apt update
apt install zsh -y
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Adds necessary packages
apt-get install curl build-essential checkinstall libssl-dev

# Install NodeJS+NPM, https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions-enterprise-linux-fedora-and-snap-packages
curl -sL https://deb.nodesource.com/setup_13.x | bash -
apt install -y nodejs

# install Rust, https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env


########################################################
# Improved tooling
########################################################

# NodeJS version manager, https://github.com/tj/n
npm i -g n
n latest

# tldr: improved 'man', https://github.com/tldr-pages/tldr
npm i -g tldr

# httpie: improved 'curl', https://github.com/jakubroztocil/httpie/
apt install httpie

# exa: improved 'ls', https://github.com/ogham/exa
cargo install exa

# fd: improved 'find', https://github.com/sharkdp/fd/
apt install fd-find

# bat: improved 'cat', https://github.com/sharkdp/bat
apt install bat

# ripgrep: improved 'grep', https://github.com/BurntSushi/ripgrep
apt install ripgrep
