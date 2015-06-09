#!/bin/bash -i 
# Specify a few colors for stuff
red='\033[0;31m'
cyan='\033[0;36m'
NC='\033[0m'
Cyan='\e[0;36m'         # Cyan
ICyan='\e[0;96m'        # Cyan
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
cd

# Here, specify any folders which contain a bunch of subfolders that are repos:
repo_folder=`ls -d ~/repo/*/`
rpack_folder=`ls -d ~/rpack/*/`

# Specify any other additional individual repos to track:

#declare -a repo_individual=("~/Rncs/dipPeak" "~/Rncs/IRangeKernels" "~/Rncs/CWriteR" "~/Rncs/LOLA" "~/Rncs/simpleCache" "~/Rncs/RHIS") 
#Combine the two:
repos=($repo_folder ${repo_individual[@]} $rpack_folder)

# Loop through all repos and check for changes:
for f in "${repos[@]}"
do
f=$(eval echo "$f") #expand
cd "$f"
if [ ! -d ".git" ];
then
echo -e "${red}`pwd`${NC}"
echo "Not a git repo."
continue
else
echo -e "${ICyan}`pwd`${NC}"
gitDiff=`gdn`
if [ -n "$gitDiff" ]; then
echo "   Uncommitted changes:"
echo -e "${IYellow}$gitDiff${NC}"
fi

# This will check for changes at the remote:
if  [ "$1" == "i" ]; then
git fetch
fi

outgoingCommits=`git log @{u}.. --oneline`
incomingCommits=`git log ..@{u}  --oneline`
if [ -n "$outgoingCommits" ]; then
echo "   Outgoing commits:"
echo -e "${IGreen}$outgoingCommits${NC}"
fi
if [ -n "$incomingCommits" ]; then
echo "   Incoming commits:"
echo -e "${IRed}$incomingCommits${NC}"
fi



fi

done

