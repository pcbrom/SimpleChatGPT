# Selected Text Integration with ChatGPT via Keyboard Shortcut

This document describes how to set up a script on Linux to capture selected text and send it to ChatGPT using a simple keyboard shortcut.

## What the Script Does

The `chatgpt-integration.sh` script performs the following tasks:

1. **Captures selected text**: The script uses `xclip` to capture the currently selected text in the clipboard.
2. **Verifies the capture**: If no text is captured, the script displays an error message using `zenity`.
3. **URL encodes the text**: The captured text is URL encoded using `jq`, ensuring special characters are correctly included in the query.
4. **Opens ChatGPT in the browser**: The script then opens the default browser with the ChatGPT URL, passing the selected text as a query parameter.

## How to Set Up

### 1. Create the Script

Create a script file in a directory of your choice, for example, `/usr/local/bin/chatgpt-integration.sh`.

```bash
sudo nano /usr/local/bin/chatgpt-integration.sh
```

Paste the following content into the file:

```bash
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

# URL encode the text
query_encoded=$(echo "$selected_text" | jq -sRr @uri)

# Open the browser with the ChatGPT URL and the query
xdg-open "https://chat.openai.com/?q=${query_encoded}"
```

### 2. Make the Script Executable

Give the script execution permission:

```bash
sudo chmod +x /usr/local/bin/chatgpt-integration.sh
```

### 3. Set Up the Keyboard Shortcut

To configure a keyboard shortcut that runs the script:

1. **Open System Settings**.
2. **Navigate to the Keyboard Shortcuts section**.
3. **Add a new shortcut**:
   - **Name**: Send to ChatGPT
   - **Command**: `/usr/local/bin/chatgpt-integration.sh`
   - **Keyboard Shortcut**: Choose a key combination that is not in use, such as `Ctrl+Alt+C`.
4. **Save** the new shortcut.

### 4. Using the Shortcut

1. **Select the text** in any application.
2. **Press the configured keyboard shortcut**.
3. The text will automatically be sent to ChatGPT in your browser.

### 5. Troubleshooting

- **Text not captured**: If the script does not capture the text, ensure that `xclip` is installed and functioning correctly.
- **Command error**: Verify that all the necessary commands (`xclip`, `jq`, `zenity`, etc.) are installed and working.

## Conclusion

This integration allows any Linux user to select text in any application and, with a simple keyboard shortcut, send that text directly to ChatGPT, streamlining workflow and productivity.
