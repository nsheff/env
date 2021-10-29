#!/bin/bash
# bash and not just sh because we are using some bash-specific syntax
if [[ "$1" == "open:"* ]]; then
    ref=${1#open://}
    #ref=$(python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])" "$ref") # If you want decoding
	# echo "$ref"
    xdg-open "$ref"
    # xdg-open "https://duckduckgo.com/?q=$ref"
else
    xdg-open "$1" # Just open with the default handler
fi