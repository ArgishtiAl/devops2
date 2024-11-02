#!/bin/bash

file_count() {
  local dir="$1"
  local count

  if [ -d "$dir" ]; then
    count=$(ls -1 "$dir" | wc -l)  
    echo "$dir:"  
    echo "$count"  
  else
    echo "$dir: is not a valid directory."
  fi
}
file_count "/etc"
file_count "/var"
file_count "/usr/bin"

