# Nathan's quick aliases.
# Generic bash aliases

# R should never ask me to save.
alias R="$(/usr/bin/which R) --no-save"
# Forward X sessions over ssh by default
alias ssh="ssh -X"

alias lsd="ls -d */"
alias tf="tail --follow"
alias ports="netstat -anltp | grep ssh"


# Prompt for a password on first swift use, to prevent
# storing password in plain text file.
swf() {
  if [ -z ${ST_KEY} ]; then echo -e "ST_USER:${ST_USER}\nPassword:"; read -s ST_KEY; fi
  export ST_KEY
  swift $@
}

# This alias will tell you how much of the CPU is currently
# being used.
busy () {
  ncpu=`lscpu | grep "^CPU(s):" | awk '{print $2}'`
  top -bn 4 -d 0.5 | grep 'Cpu.s.' | tail -n 3 | gawk '{print $2+$4+$6}  (($2+$4+$6) * $ncpu of $ncpu)'
}

cdp() {
  cd $PROCESSED/$1
}

# Combine pdf
cpdf() {
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=merged.pdf \
"$@"
}

# does folder exist?
fe () {
for var in "$@"
do
if [ -e "$var" ]
then
	echo -n "$var "
else
	echo " "
fi
done
}

export -f fe

# Combined cd and ls
cs () {
        cd $1;
        ls -F --color=auto
}

umask 002

# Counts files in each subdirectory, by @Thor
cf () {
find . -maxdepth 1 -mindepth 1 -type d | while read dir; do   printf "%-25.25s : " "$dir";   find "$dir" -type f | wc -l; done
}

cfdu() {
  find . -maxdepth 1 -mindepth 1 -type d | while read dir; do diskrep "$dir"; done;
}

# Tar up a folder. Creates an archive of a folder
tu () { 
tar -czpf $1.tgz $1
}

PYTHONPATH=$PYTHONPATH:~/mypython

# Untested attempt at a disk usage report.
diskrep () {
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
