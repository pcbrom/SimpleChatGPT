#!/bin/bash

# Captura o texto selecionado usando xclip
selected_text=$(xclip -o)

# Abre uma caixa de diálogo para confirmar ou modificar o texto
query=$(zenity --entry --title="Send to ChatGPT" --text="Paste your text:" --entry-text="$selected_text")

# Se a entrada não estiver vazia
if [ ! -z "$query" ]; then
    # Abre o navegador com a URL do ChatGPT e a consulta
    xdg-open "https://chat.openai.com/?q=${query}"
fi

