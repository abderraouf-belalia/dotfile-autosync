OPENAI_API_KEY=cat $HOME/.secrets | grep "openai" | awk 'BEING{FS=":"}{print $2}'

