#!/bin/bash

read -p "Please enter a file extension: " extension
default_prefix=$(date +%Y-%m-%d)

read -p "Please enter a file prefix (Press ENTER for $default_prefix): " prefix
prefix=${prefix:-$default_prefix}

for file in *."$extension"; do
    if [[ -f $file ]]; then
        new_name="${prefix} ${file}"
        echo "Renaming $file to $new_name."
        mv "$file" "$new_name"
    else
        echo "No files found with the extension .$extension"
        break
    fi
done

