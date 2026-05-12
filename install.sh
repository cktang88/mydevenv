#!/bin/bash
#
# macOS dev environment installer.
# Run WITHOUT sudo — brew refuses sudo, and per-user installers go in $HOME.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script targets macOS only." >&2
  exit 1
fi

########################################################
# Homebrew (the one prerequisite)
########################################################

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

########################################################
# Base CLI tools via brew
########################################################

brew update
brew install \
  node \
  vim \
  git \
  gh \
  ripgrep \
  zoxide \
  fzf \
  tldr \
  jq \
  ast-grep

brew install --cask codex
brew install claude-code

# fzf shell integration (key bindings, completion)
"$(brew --prefix)"/opt/fzf/install --all --no-update-rc

########################################################
# oh-my-zsh + plugins
########################################################

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

########################################################
# Dotfiles
########################################################

cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
# append delta + alias config to existing ~/.gitconfig (don't clobber name/email)
if ! grep -q "# mydevenv" "$HOME/.gitconfig" 2>/dev/null; then
  printf "\n# mydevenv\n" >> "$HOME/.gitconfig"
  cat "$SCRIPT_DIR/.gitconfig" >> "$HOME/.gitconfig"
fi

########################################################
# JS package managers: pnpm + yarn via corepack (ships with Node),
# bun via official installer.
########################################################

corepack enable
corepack prepare pnpm@latest --activate
corepack prepare yarn@stable --activate

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
# Declarative configs in ./configs/ copied into canonical
# global locations. See README "Security" section.
########################################################

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

# pnpm writes to ~/Library/Preferences/pnpm/rc on macOS — let the CLI find it.
if command -v pnpm >/dev/null 2>&1; then
  pnpm config set minimumReleaseAge 10080 --location=user
fi

echo
echo "Done. Open a new terminal (or 'source ~/.zshrc') to pick up changes."
