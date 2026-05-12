#!/bin/bash

########################################################
# Run this script with sudo permissions
########################################################

set -o verbose #echo commands

apt update

# NOTE: zsh is default on MacOS

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

########################################################
# Improved tooling
########################################################

# NodeJS version manager, https://github.com/tj/n (see also: https://github.com/tj/n#third-party-installers)
npm i -g n
n latest

# tldr: improved 'man', https://github.com/tldr-pages/tldr
npm i -g tldr

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

########################################################
# JS package managers: pnpm + yarn via corepack (ships with Node),
# bun via official installer.
# We want these on $PATH because the security configs target them.
########################################################

if command -v corepack >/dev/null 2>&1; then
  corepack enable
  corepack prepare pnpm@latest --activate
  corepack prepare yarn@stable --activate
fi

if ! command -v bun >/dev/null 2>&1; then
  curl -fsSL https://bun.sh/install | bash
fi

########################################################
# Python tooling.
#  - uv via Astral's standalone installer (supports `uv self update`).
#  - pip bumped to >= 26.0 so its `uploaded-prior-to` setting works.
#    On Homebrew Python this requires --break-system-packages; brew
#    may revert pip on `brew upgrade python`, in which case re-run.
########################################################

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if command -v python3 >/dev/null 2>&1; then
  python3 -m pip install --upgrade pip --break-system-packages || \
    python3 -m pip install --upgrade pip
fi

########################################################
# Package-manager security hardening.
# Declarative configs live in ./configs/ and get copied to the
# canonical global locations. See README "Security" section.
#
# Covers (where supported natively):
#   - 7-day minimum release age across npm/pnpm/yarn/bun/uv/pip
#   - lifecycle-script blocking (npm, yarn)
#   - Yarn Berry hardened mode (lockfile poisoning protection)
#   - pip require-virtualenv
########################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_config() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -f "$dest" ] && ! cmp -s "$src" "$dest"; then
    cp "$dest" "$dest.bak.$(date +%s)"
    echo "  backed up existing $dest"
  fi
  cp "$src" "$dest"
  echo "  installed $dest"
}

echo "Installing package-manager security configs..."
install_config "$SCRIPT_DIR/configs/npmrc"       "$HOME/.npmrc"
install_config "$SCRIPT_DIR/configs/yarnrc.yml"  "$HOME/.yarnrc.yml"
install_config "$SCRIPT_DIR/configs/bunfig.toml" "$HOME/.bunfig.toml"
install_config "$SCRIPT_DIR/configs/uv.toml"     "$HOME/.config/uv/uv.toml"
install_config "$SCRIPT_DIR/configs/pip.conf"    "$HOME/.config/pip/pip.conf"

# pnpm: writes to a per-OS location (~/Library/Preferences/pnpm/rc on macOS,
# ~/.config/pnpm/rc on Linux). Use the CLI so pnpm picks the right path.
if command -v pnpm >/dev/null 2>&1; then
  pnpm config set minimumReleaseAge 10080 --location=user
fi

########################################################
# Set default shell as zsh
########################################################

chsh -s $(which zsh)

set +o verbose # echo commands off
