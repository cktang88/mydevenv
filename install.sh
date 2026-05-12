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
# Python tooling: uv (replaces pip/pyenv/poetry/pipx)
# Installed via Astral's standalone installer so `uv self update` works.
########################################################

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

########################################################
# Supply-chain hardening: 7-day minimum release age across
# every package manager that supports it natively.
# See README "Security" section for rationale.
########################################################

MIN_AGE_DAYS=7
MIN_AGE_MINUTES=$((MIN_AGE_DAYS * 24 * 60))   # 10080
MIN_AGE_SECONDS=$((MIN_AGE_DAYS * 24 * 60 * 60)) # 604800

# npm (>= 11.10.0) — days
if command -v npm >/dev/null 2>&1; then
  npm config set min-release-age "$MIN_AGE_DAYS" --location=user
fi

# pnpm (>= 10.16) — minutes
if command -v pnpm >/dev/null 2>&1; then
  pnpm config set minimumReleaseAge "$MIN_AGE_MINUTES" --location=user
fi

# Yarn Berry (>= 4.10) — minutes. Write ~/.yarnrc.yml so the setting
# is in place once the user runs `yarn set version berry`. Yarn v1
# (classic) ignores this file; that's fine.
mkdir -p "$HOME"
cat > "$HOME/.yarnrc.yml" <<EOF
npmMinimalAgeGate: $MIN_AGE_MINUTES
EOF

# Bun (>= 1.3) — seconds, in [install] section of ~/.bunfig.toml
if [ ! -f "$HOME/.bunfig.toml" ] || ! grep -q '^\[install\]' "$HOME/.bunfig.toml"; then
  printf '\n[install]\nminimumReleaseAge = %s\n' "$MIN_AGE_SECONDS" >> "$HOME/.bunfig.toml"
else
  # replace existing value or append under [install]
  if grep -q '^minimumReleaseAge' "$HOME/.bunfig.toml"; then
    sed -i.bak "s/^minimumReleaseAge.*/minimumReleaseAge = $MIN_AGE_SECONDS/" "$HOME/.bunfig.toml" && rm -f "$HOME/.bunfig.toml.bak"
  else
    sed -i.bak "/^\[install\]/a\\
minimumReleaseAge = $MIN_AGE_SECONDS
" "$HOME/.bunfig.toml" && rm -f "$HOME/.bunfig.toml.bak"
  fi
fi

# uv (>= 0.9.17) — rolling duration string
mkdir -p "$HOME/.config/uv"
cat > "$HOME/.config/uv/uv.toml" <<EOF
exclude-newer = "$MIN_AGE_DAYS days"
EOF

# pip (>= 26.0) — ISO 8601 duration
if command -v pip3 >/dev/null 2>&1; then
  pip3 config set --user install.uploaded-prior-to "P${MIN_AGE_DAYS}D"
fi

########################################################
# Set default shell as zsh
########################################################

chsh -s $(which zsh)

set +o verbose # echo commands off
