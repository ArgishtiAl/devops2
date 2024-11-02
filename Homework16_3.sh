#!/bin/bash
read -p "How many lines of /etc/passwd would you like to see? " num_lines
line_number=1

while IFS= read -r line && [ "$line_number" -le "$num_lines" ]; do
    echo "$line"
    ((line_number++))
done < /etc/passwd

