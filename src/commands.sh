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
