#!/bin/bash

if [[ $# -eq 0 ]]
then
  dir=~                            # Default to home
else
  dir=$1
fi

echo "Copying scripts to ${dir}"
cp *.sh ${dir}
rm "${dir}/${0}"                   # Dont copy over the control script

