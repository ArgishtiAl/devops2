#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file_or_directory_name>"
  exit 3
fi

if [ -f "$1" ]; then
  echo "$1 is a regular file."
  exit 0 
elif [ -d "$1" ]; then
  echo "$1 is a directory."
  exit 1
else
  echo "$1 is some other type of file."
  exit 2  
fi

