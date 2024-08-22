#!/bin/bash

# Capture selected text using xclip
query=$(zenity --entry --title="Send to ChatGPT" --text="Paste your text:" --entry-text="$selected_text")

# Verify if the text was correctly captured
if [ ! -z "$query" ]; then
    # Abre o navegador com a URL do ChatGPT e a consulta
    xdg-open "https://chat.openai.com/?q=${query}"
fi
