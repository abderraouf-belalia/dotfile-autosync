# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes. Aliases can be placed 
# here, though oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder. For a full list of 
# active aliases, run `alias`.

# ZSH ALIASES
ZSH_CONFIG=~/.config/zsh

alias zshconfig="nvim ~/.zshrc" 
alias reload="source ~/.zshrc"

alias alsconfig="nvim $ZSH_CONFIG/aliases.zsh"
alias funcconfig="nvim $ZSH_CONFIG/functions.zsh"
alias aprcconfig="nvim $ZSH_CONFIG/appearance.zsh"
alias optconfig="nvim $ZSH_CONFIG/options.zsh"


# NVIM ALIASES
NVIM_CONFIG=~/.config/nvim
PLUGIN_CONFIG=$NVIM_CONFIG/lua/core/plugin_config
CORE_CONFIG=$NVIM_CONFIG/lua/core

nvim -v &>/dev/null || alias nvim=~/.squashfs-root/usr/bin/nvim

alias nvimconfig="nvim $NVIM_CONFIG/init.lua"
alias nvimkeyconfig="nvim $CORE_CONFIG/keymaps.lua"
alias nvimplugconfig="nvim $PLUGIN_CONFIG/init.lua"


# GIT ALIASES
alias push=gitpush
alias pull=gitpull
alias fetch=gitfetch

# MOVEMENT
alias home="cd ~"
alias back="cd -"
alias work="cd ~/work"
alias notes="cd ~/notes"
alias cheatsheet="nvim $CHEATSHEET"


# UTILITIES
alias qr="qrencode -t ansiutf8"

# NOTES
thoughtfolio="cd ~/notes/Thoughtfolio"
codefolio="cd ~/notes/Codefolio"
