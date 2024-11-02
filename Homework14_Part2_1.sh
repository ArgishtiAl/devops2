#!/bin/bash

file_count() {
  local count
  count=$(ls -1 | wc -l) 
  echo "Number of files in the current directory: $count"
}

file_count

