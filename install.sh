#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

echo "Getting edi via Github..."

# Attempt to download the script
wget -q "https://raw.githubusercontent.com/AronasGITHUB/edi/refs/heads/main/edi.sh?token=GHSAT0AAAAAACZVTT3K5P3ADCZSKXK3M25WZZA4PQQ" -O edi.sh

# Check if the download was successful
if [ $? -ne 0 ]; then
    handle_error "Failed to download edi.sh"
fi

# Check if the file was created
if [ ! -f edi.sh ]; then
    handle_error "Download failed. edi.sh not found."
fi

echo "Done!"

echo "Applying edi..."

# Check if .bashrc exists before modifying
if [ -f ~/.bashrc ]; then
    echo "alias edi='./edi.sh'" >> ~/.bashrc
    echo "Done!"
else
    handle_error ".bashrc not found. Please check your home directory."
fi

echo "To apply changes, please restart your terminal or run 'source ~/.bashrc'."
echo "Execute edi by typing 'edi' in the terminal."
