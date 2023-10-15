# KEYS
export OPENAI_API_KEY=$(cat "$HOME/.secrets" | grep "openai"| awk 'BEGIN{FS=":"}{print $2}')

# FILES
export CHEATSHEET="~/.config/nvim/cheatsheet.txt"

# CONFIG FILES
export NVIMCONFIG="$HOME/.config/nvim/init.lua"
