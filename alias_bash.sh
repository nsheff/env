# Nathan's quick aliases.
# Generic bash aliases

alias R="$(/usr/bin/which R) --no-save"
alias lsd="ls -d */"
alias ssh="ssh -X"

cs ()
{
        cd $1;
        ls -F --color=auto
}

umask 002

PYTHONPATH=$PYTHONPATH:~/mypython
