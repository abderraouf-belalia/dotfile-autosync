export OPENAI_API_KEY=$(cat "$HOME/.secrets" | grep "openai"| awk 'BEGIN{FS=":"}{print $2}')

export CHEATSHEET="~/.config/nvim/cheatsheet.txt"
