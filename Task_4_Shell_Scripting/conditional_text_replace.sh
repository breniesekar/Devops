#!/bin/bash
# ------------------------------------------------------------
# Script Name: conditional_text_replace.sh
# Description: Shell script to replace all occurrences of the word
#              "give" with "learning" from line 5 onward,
#              only in lines that contain the word "welcome".
# ------------------------------------------------------------

# Step 1: Accept the input filename from the first command-line argument
file="$1"

# Step 2: Check if the filename argument is provided
# -z "$file" → true if the variable is empty
if [ -z "$file" ]; then
    echo "Usage: $0 <filename>"
    exit 1

# Step 3: Check if the specified file actually exists
# -f "$file" → true if it’s a regular file
elif [ ! -f "$file" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi

# Step 4: Use sed to perform the replacement
# 5,$                  	→ apply from line 5 to the end of the file
# /welcome/         	→ restrict action to lines containing "welcome"
# s/give/learning/g 	→ substitute all "give" with "learning" in matching lines
# -i                		→ edit the file in place (save changes directly)
sed -i '5,${/welcome/s/give/learning/g}' "$file"

# Step 5: Print completion message
echo "Replacement completed in '$file'."
