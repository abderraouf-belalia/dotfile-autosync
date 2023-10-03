#! /bin/bash

. utils.sh

BACKUP_LOCATION=$(pwd)

# Check for important commands
echo "[*] Checking for command availability ..."
## Check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "[+] Git is available."
else
  echo "[-] Git is not installed."
  exit 1
fi

# Fetches remote
echo "[*] Fetching from remote ..."
git fetch

cd ~
# Syncing dotfiles
## NVIM
bisync "nvim" "/dotfiles/nvim/" $BACKUP_LOCATION

## ZSH
bisync "zsh" "/dotfiles/zsh/" $BACKUP_LOCATION

# Backup local changes
cd $BACKUP_LOCATION
gitlocalcheck
