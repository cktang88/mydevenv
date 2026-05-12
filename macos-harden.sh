#!/bin/bash
#
# Optional macOS system hardening. Run with sudo, separately from install.sh:
#
#   sudo ./macos-harden.sh
#
# Idempotent. None of these is destructive, but they touch system prefs —
# review the contents before running on a machine you didn't set up yourself.
#
set -euo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
  echo "macOS only." >&2
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "Re-run with sudo." >&2
  exit 1
fi

echo "== Firewall: on, stealth mode on, block unsigned/auto-allow off =="
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

echo "== Screensaver: require password immediately =="
# Apply to the calling user (sudo's caller), not root.
TARGET_USER="${SUDO_USER:-$USER}"
sudo -u "$TARGET_USER" defaults write com.apple.screensaver askForPassword -int 1
sudo -u "$TARGET_USER" defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "== Disable Power Nap (no background network while asleep) =="
pmset -a powernap 0 || true

echo "== Finder: show file extensions, hidden files, full POSIX path in title =="
sudo -u "$TARGET_USER" defaults write NSGlobalDomain AppleShowAllExtensions -bool true
sudo -u "$TARGET_USER" defaults write com.apple.finder AppleShowAllFiles -bool true
sudo -u "$TARGET_USER" defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
sudo -u "$TARGET_USER" defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
sudo -u "$TARGET_USER" defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "== Gatekeeper: verify enabled =="
spctl --status || true

echo "== FileVault status (enable manually via System Settings if Off) =="
fdesetup status || true

killall Finder >/dev/null 2>&1 || true
killall SystemUIServer >/dev/null 2>&1 || true

echo
echo "Done. Some changes take effect on next login or app restart."
echo "If FileVault is Off above, enable it in System Settings → Privacy & Security."
