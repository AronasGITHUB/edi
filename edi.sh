#!/bin/bash

# ED Improved
# A text editor inspired by vim and ed.

function menu() {
    clear
    echo "-----------------------"
    echo "  EDI - ED Improved    "
    echo "-----------------------"
    echo "Type e to edit a file"
    echo "Opened on mistake? Type q"
    echo "Need help? type h"
    echo
    while true; do
        read -p "Command: " cmd
        case $cmd in
            h)
                hlp
                ;;
            q)
                clear
                exit 0
                ;;
            sq)
                read -p "Which file do you want to save? " wq_save
                # Checks if the file exists
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
                ;;
            s)
                read -p "Which file do you want to save? " s_save
                # Checks if file exists: The sequel
                if [[ -n "$s_save" ]]; then
                    if echo "" >> "$s_save"; then
                        echo "File saved as $wq_save."
                    else
                        echo "[!] Error: Unable to save to '$s_save'."
                    fi
                else
                    echo "[!] Error: No file specified."
                fi
                ;;
            a)
                read -p "Which file do you want to append to? " a_append
                # Checks if file exists: The sequel: The sequel
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
                ;;
            la)
                read -p "In which line do you want to append? " la_line
                read -p "Which file do you want to append to? " la_file
                # Checks if file exists: The sequel: The sequel: The sequel
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
                ;;
            e)
                read -p "In which line do you want to edit? " e_line
                read -p "Which file do you want to edit? " e_file
                # Checks if file exists: The sequel: The sequel: The sequel: The sequel
                # Guys this is the best sequel you got to watch it
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
                ;;
            v)
                read -p "Which file do you want to view? " v_file
                # Checks if file exists: The sequel: The sequel: The sequel: The sequel: The sequel
                if [[ -f "$v_file" ]]; then
                    clear
                    cat "$v_file"
                    echo ""
                    read -p "Press any key to continue..."
                else
                    echo "[!] Error: File '$v_file' does not exist."
                fi
                ;;
            nl)
                read -p "Which file do you want to create a new line on? " nl_file
                echo "" >> $nl_file
                ;;
            d)
                read -p "Which line do you want to delete? " d_line
                read -p "Which file do you want to delete that line on? "
    			# Check if the line number is valid
    			if sed -i "${d_line}d" "$file"; then
      			  echo "Line $d_line deleted."
   				 else
       				 echo "[!] Error: Unable to delete line $d_line."
   				 fi
   				 ;;
            *)
                echo "[!] Error: Invalid command."
                ;;
        esac
    done
}

function hlp() {
    clear
    echo "EDI - ED Improved"
    echo "EDI is an improved version of ed, a text editor"
    echo "EDI is inspired by vim and ed"
    echo ""
    echo "List of commands:"
    echo "h - This help screen"
    echo "q - Exits EDI"
    echo "sq - Saves and quits EDI"
    echo "s - Saves a file"
    echo "a - Appends to a file"
    echo "la - Append after a line"
    echo "e - Edits a line"
    echo "v - Views a file"
    echo "nl - New line"
    echo "d - Delete a line"
    echo ""
    read -p "Press any key to continue..."
    menu
}

# Start the menu
menu
