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

export gitpush 
export gitpull 
export gitfetch
