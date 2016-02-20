# Nathan's quick aliases.
# Generic bash aliases

alias R="$(/usr/bin/which R) --no-save"
alias lsd="ls -d */"
alias ssh="ssh -X"
alias tf="tail --follow"


# Combined cd and ls
cs ()
{
        cd $1;
        ls -F --color=auto
}

umask 002

# Counts files in each subdirectory, by @Thor
cf () 
{
find . -maxdepth 1 -mindepth 1 -type d | while read dir; do   printf "%-25.25s : " "$dir";   find "$dir" -type f | wc -l; done
}

# Tar up a folder. Creates an archive of a folder
tu ()
{ 
tar -czpf $1.tgz $1
}
PYTHONPATH=$PYTHONPATH:~/mypython

diskrep ()
{
  diskUse=$(du -s "$1" | cut -f1)
  #regex="(.*)"
  #[[ $diskUse =~ $regex ]]
#  gigUse="${BASH_REMATCH[1]}"
  
  # file count
  fileCount=$(find "$1" -type f | wc -l)
  # echo $1:  $diskUse : $fileCount
  
  if [ $diskUse -gt 1000000 ] || [ $fileCount -gt 50 ]
    then
    gigs=$(($diskUse/1000000))
    echo "$1" ${gigs}G : ${fileCount}
  fi
  

}

cf() {
 find . -maxdepth 1 -mindepth 1 -type d | while read dir; do   printf "%-25.25s : " "$dir";   find "$dir" -type f | wc -l; done
}

cfdu() {
  find . -maxdepth 1 -mindepth 1 -type d | while read dir; do diskrep "$dir"; done;
}
