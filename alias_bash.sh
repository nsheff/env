# Nathan's quick aliases.
# Generic bash aliases

alias R="$(/usr/bin/which R) --no-save"
alias lsd="ls -d */"
alias ssh="ssh -X"

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
tar -cvzpf $1.tgz $1
}
PYTHONPATH=$PYTHONPATH:~/mypython
