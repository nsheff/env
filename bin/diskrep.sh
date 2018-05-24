#!/bin/bash

# Untested attempt at a disk usage report.

diskrep () {
  
  folders=$@
  for folder in $folders
  do

  # get file size
  diskUse=$(du -s "$folder" | cut -f1)
  #regex="(.*)"
  #[[ $diskUse =~ $regex ]]
#  gigUse="${BASH_REMATCH[1]}"
  
  # get file count
  fileCount=$(find "$folder" -type f | wc -l)
  # echo $1:  $diskUse : $fileCount
  
  if [ $diskUse -gt 1000000 ] || [ $fileCount -gt 50 ]
    then
    gigs=$(($diskUse/1000000))
    echo -e "$folder  ${gigs}G \t ${fileCount} files"
  fi
  done
}

diskrep $@


