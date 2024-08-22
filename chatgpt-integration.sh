#!/bin/bash

# Capture selected text using xclip
selected_text=$(xclip -o)
query=$(zenity --entry --title="Send to ChatGPT" --text="Paste your text:" --entry-text="$selected_text")

# Verify if the text was correctly captured
if [ ! -z "$query" ]; then
    # Codifica a consulta para ser usada em uma URL
    encoded_query=$(echo "$query" | jq -sRr @uri)
    
    # Abre o navegador com a URL do ChatGPT e a consulta
    xdg-open "https://chat.openai.com/?q=$encoded_query"
fi
