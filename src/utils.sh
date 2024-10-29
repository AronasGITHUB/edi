#!/bin/bash

# utils.sh
# Utility functions for edi
# This script contains helper functions to be used within the edi editor.
# These functions are not meant to be executed directly.

# Function to check if a file exists
file_exists() {
    local file="$1"
    if [[ -f "$file" ]]; then
        return 0  # File exists
    else
        echo "[!] Error: File '$file' does not exist."
        return 1  # File does not exist
    fi
}

# Function to save content to a file
save_file() {
    local file="$1"
    local content="$2"
    if echo "$content" >> "$file"; then
        echo "Content saved to '$file'."
    else
        echo "[!] Error: Unable to save to '$file'."
    fi
}

# Function to append content to a specific line in a file
append_to_line() {
    local line="$1"
    local file="$2"
    local content="$3"
    if file_exists "$file"; then
        if sed -i "${line}a ${content}" "$file"; then
            echo "Content appended to line $line in '$file'."
        else
            echo "[!] Error: Unable to append content to '$file'."
        fi
    fi
}

# Function to edit a specific line in a file
edit_line() {
    local line="$1"
    local file="$2"
    local new_content="$3"
    if file_exists "$file"; then
        if sed -i "${line}s/.*/${new_content}/" "$file"; then
            echo "Line $line in '$file' edited."
        else
            echo "[!] Error: Unable to edit line $line in '$file'."
        fi
    fi
}

# Function to view the content of a file
view_file() {
    local file="$1"
    if file_exists "$file"; then
        clear
        cat "$file"
        echo ""
        read -p "Press any key to continue..."
    fi
}

# Function to create a new line in a file
create_new_line() {
    local file="$1"
    echo "" >> "$file"
}


# More coming soon

