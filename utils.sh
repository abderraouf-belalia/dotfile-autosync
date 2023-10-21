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
	git add .
	git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
  clipsecret github 2>/dev/null || echo "[-] Secret clipping failed."
	git push 
}

# Sync folders back and forth
function bisync {
	local PROGRAM=$1
	local BACKUP_PATH=$3$2
  local REPO_PATH=$3
	grep "$PROGRAM" $REPO_PATH"/dotfile.linux.path" | awk 'BEGIN{FS=":"}{print $2}' | while read -r path; 
	do 
		rsync -avu $BACKUP_PATH $path
		rsync -avu --delete $path $BACKUP_PATH 
	done
}
