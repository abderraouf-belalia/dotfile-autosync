#! /bin/bash

. utils.sh

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

# Syncing dotfiles
## NVIM 
bisync "nvim" dotfiles/nvim

## ZSH
bisync "zsh" dotfiles/zsh

# Backup local changes
gitlocalcheck


# FUNCTIONS
# Check git status
function gitlocalcheck {
	GIT_STATUS="$(git status | grep -i "modified")"
	
	# If there is a new change
	if [[ $GIT_STATUS == *"modified"* ]]; then
	  echo "[*] Pushing to origin ..."
	  gitpush
	fi
	
}

# Push to Github
function gitpush {
	git add -u;
	git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
	git push origin master
}

# Sync folders back and forth
function bisync {
	local PROGRAM=$1
	local BACKUP_PATH=$2
	grep "$PROGRAM" dotfile.paths | awk 'BEGIN{FS=":"}{print $2}' | while read -r path; 
	do 
		rsync -avu $BACKUP_PATH $path
		rsync -avu $path $BACKUP_PATH 
	done
}
