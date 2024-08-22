#!/bin/bash

# Capture the selected text using xclip
selected_text=$(xclip -o)

# Open a dialog box to confirm or modify the text
query=$(zenity --entry --title="Send to ChatGPT Mini" --text="Paste your text:" --entry-text="$selected_text")

# If the input is not empty
if [ ! -z "$query" ]; then
    # Encode the query to be used in a URL
    encoded_query=$(echo "$query" | jq -sRr @uri)
    
    # Define the screen resolution (replace if necessary)
    screen_width=1920
    screen_height=1080
    
    # Calculate the position on the right side of the screen
    window_width=400
    window_height=800
    window_x=$((screen_width - window_width))
    window_y=$((screen_height / 2 - window_height / 2))  # Centered vertically
    
    # Open the browser in a new incognito tab with custom size and position
    google-chrome --incognito --window-size=$window_width,$window_height --window-position=$window_x,$window_y --app="https://chatgpt.com/?model=gpt-4o-mini&q=$encoded_query"
fi
