#!/bin/bash

# commands.sh
# This script contains command definitions for EDI - ED Improved.
# Please refer to our license for details on usage and contributions.

# NOTE: This file is NOT meant to be executed directly. 
# It serves as a collection of command scripts for use within EDI.

# Each command block is structured to fit within a case statement.
# Remember to use ";;" at the end of each command block.

# Example command structure:
# Command name
# # Functionality description
# <command logic>
# ;;

# h - Help command
# Invokes the help function 'hlp'.
hlp

# q - Quit command
# Clears the screen and exits the editor.
clear
exit 0

# sq - Save and quit command
# Prompts the user for a filename to save and exits.
read -p "Which file do you want to save? " wq_save
if [[ -n "$wq_save" ]]; then
    if echo "" >> "$wq_save"; then
        echo "File saved as $wq_save."
    else
        echo "[!] Error: Unable to save to '$wq_save'."
    fi
else
    echo "[!] Error: No file specified."
fi
clear
exit 0

# s - Save command
# Prompts the user for a filename to save.
read -p "Which file do you want to save? " s_save
if [[ -n "$s_save" ]]; then
    if echo "" >> "$s_save"; then
        echo "File saved as $s_save."
    else
        echo "[!] Error: Unable to save to '$s_save'."
    fi
else
    echo "[!] Error: No file specified."
fi

# a - Append command
# Prompts the user for a file to append content to.
read -p "Which file do you want to append to? " a_append
if [[ -f "$a_append" ]]; then
    read -p "Which contents do you want to append? " a_content
    if echo "$a_content" >> "$a_append"; then
        echo "Content appended to '$a_append'."
    else
        echo "[!] Error: Unable to append to '$a_append'."
    fi
else
    echo "[!] Error: File '$a_append' does not exist."
fi

# la - Line append command
# Prompts for a line number and appends content after it.
read -p "In which line do you want to append? " la_line
read -p "Which file do you want to append to? " la_file
if [[ -f "$la_file" ]]; then
    read -p "Which contents do you want to append? " la_content
    if sed -i "${la_line}a ${la_content}" "$la_file"; then
        echo "Content appended to line $la_line in '$la_file'."
    else
        echo "[!] Error: Unable to append content to '$la_file'."
    fi
else
    echo "[!] Error: File '$la_file' does not exist."
fi

# e - Edit command
# Prompts for a line number and allows editing of that line.
read -p "In which line do you want to edit? " e_line
read -p "Which file do you want to edit? " e_file
if [[ -f "$e_file" ]]; then
    read -p "Enter the full contents of the line: " e_content
    if sed -i "${e_line}s/.*/${e_content}/" "$e_file"; then
        echo "Line $e_line in '$e_file' edited."
    else
        echo "[!] Error: Unable to edit line $e_line in '$e_file'."
    fi
else
    echo "[!] Error: File '$e_file' does not exist."
fi

# v - View command
# Prompts for a file to display its contents.
read -p "Which file do you want to view? " v_file
if [[ -f "$v_file" ]]; then
    clear
    cat "$v_file"
    echo ""
    read -p "Press any key to continue..."
else
    echo "[!] Error: File '$v_file' does not exist."
fi

# nl - New line command
# Creates a new line in the specified file.
read -p "Which file do you want to create a new line on? " nl_file
echo "" >> "$nl_file"

# * - Invalid command
echo "[!] Error: Invalid command."
