#!/bin/bash

#  commands.sh
# This is a file of commands in edi.
# Check our license to see what can you do with this script.

# THIS FILE IS NOT MEANT TO BE EXECUTED, THESE ARE SCRIPTS YOU CAN TAKE.

# In case statements, and ";;" at the end.

# Like, this example:
# Commands here
# ;;


# h
# Please provide a seperate function named 'hlp'
hlp

# q
clear
exit 0

# sq
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

# s
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

# a
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


# la
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



