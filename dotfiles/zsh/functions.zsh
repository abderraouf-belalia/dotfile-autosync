# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GIT FUNCTIONS
function gitpush {
  git add .
  git commit -m "$*"
  git push
}

function gitpull {
  clipsecret github
  git pull
}

function gitfetch {
  git fetch
}

# CONFIG FUNCTIONS
function autosyncdotfiles {
  declare -g AUTOSYNC_DOTFILES_PATH=~/dotfile-autosync
  [ -d $AUTOSYNC_DOTFILES_PATH ] \
    && cd $AUTOSYNC_DOTFILES_PATH \
    && (./sync.sh 2>/dev/null || (chmod +x ./sync.sh && ./sync.sh)) \
    && cd -
}

# MISC FUNCTIONS
function clipsecret {
  if [ -z "${TERMUX_VERSION}"]; 
  then; 
    return false;
  fi
  declare -g SECRETS_PATH=~/.secrets

  # Checks if xclip is installed.
  (xclip -version |& grep 'version' >/dev/null) || (echo "[!] Install xclip utlity." && exit 1)
  
  cat $SECRETS_PATH | grep "$1" | awk 'BEGIN{FS=":"}{print $2}' | xclip -selection clipboard
}

# CHECKERS


export gitpush 
export gitpull 
export gitfetch

export autosyncdotfiles

export clipsecret
