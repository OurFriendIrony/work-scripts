#!/bin/bash

fileOrig="$1" 
fileNew="${fileOrig}.new"

tr -d ' \t\n\r\f' <"${fileOrig}" >"${fileNew}"
mv ${fileNew} ${fileOrig}

