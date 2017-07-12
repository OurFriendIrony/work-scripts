#!/bin/bash

# Check Input
if [[ $# -eq 0 ]] ; then
  echo 'Please specify a file path'
  exit 0
fi

# Clean
fileOrig="$1" 
fileNew="${fileOrig}.new"

tr -d ' \t\n\r\f' <"${fileOrig}" >"${fileNew}"
mv ${fileNew} ${fileOrig}

