#!/bin/bash

# Get Sudo
if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

# Purge
rm -rf **/bin **/test-output **/build **/target
rm -rf **/cucumber.properties

