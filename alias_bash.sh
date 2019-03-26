# Nathan's quick aliases.
# Generic bash aliases

# R should never ask me to save.
# This doesn't work if you don't already have R loaded when this script is run.
# Better to do this from within .Rprofile.
# alias R="$(/usr/bin/which R 2> /dev/null) --no-save"
# Forward X sessions over ssh by default
alias ssh="ssh -X"
alias lsd="ls -d */"
alias tf="tail --follow"
alias ports="netstat -anltp | grep ssh"
alias mytop='top -M -u $USER'


# Set my umask so that by default, everything I do is group-writable
umask 002

piuu() {
  pip install --user --upgrade $1
}

# This alias will tell you how much of the CPU is currently being used. It's
# useful for monitoring a server so you can be a good citizen and not
# overconsume resources
busy () {
  ncpu=`lscpu | grep "^CPU(s):" | awk '{print $2}'`
  top -bn 4 -d 0.5 | grep 'Cpu.s.' | tail -n 3 | gawk '{print $2+$4+$6}  (($2+$4+$6) * $ncpu of $ncpu)'
}

cdp() {
  cd $PROCESSED/$1
}


# convert inkscape black to white.
function b2w {
  file=${1%.*}
  echo $file
  sed 's/000000/FFFFFF/g' $1 > ${file}_white.svg  
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


# ------------------------------------------------------------------------------
# Interacting with file management

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


findin() {
  # Finds any files in or below the cwd with $1 in the contents of the file
  find . -type f -exec grep -il "$1" {} \;
}

findname() {
  # Finds any files in or below the cwd with $1 in the filename
  find . -name "*$1*"
}
