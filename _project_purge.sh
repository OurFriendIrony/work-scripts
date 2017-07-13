#!/bin/bash

# Get Sudo
if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

function deleteDirectories() {
  declare -a dirs=( $(find . -type d -name "$1") )
  for dir in ${dirs[@]}
  do
    echo "Removing dir: ${dir}"

    # Force remove it from git
    git rm -rf --ignore-unmatch -- ${dir} > /etc/null

    # Force delete file from system
    rm -rf ${dir} > /etc/null
  done
}

function deleteFiles() {
  declare -a files=( $(find . -name "$1") )
  for file in ${files[@]}
  do
    echo "Removing file: ${file}"

    # Force remove it from git
    git rm -f --ignore-unmatch -- ${file} > /etc/null

    # Force delete file from system
    rm -f ${file} > /etc/null
  done
}

# Purge Directories
deleteDirectories "bin"
deleteDirectories "build"
deleteDirectories "test-output"
deleteDirectories "target"

# Purge files
deleteFiles "cucumber.properties"

