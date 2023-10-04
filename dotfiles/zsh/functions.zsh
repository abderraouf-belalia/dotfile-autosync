# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GIT FUNCTIONS
function gitpush {
  git add .
  git commit -m "$*"
  git push
}

function gitpull {
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

export gitpush 
export gitpull 
export gitfetch

export autosyncdotfiles
