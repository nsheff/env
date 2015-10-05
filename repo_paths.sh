# If you specify some folders where you store your git repos, the script will go through each
# repo in those folders and add any "/bin" folders to your path.

# Here, specify any folders which contain a bunch of subfolders that are repos:
repo_folder=`ls -d ~/repo/*/ 2>/dev/null`
rpack_folder=`ls -d ~/code/*/ 2>/dev/null`

# Specify any other additional individual repos to track:

#declare -a repo_individual=("~/Rncs/dipPeak" "~/Rncs/IRangeKernels" "~/Rncs/CWriteR" "~/Rncs/LOLA" "~/Rncs/simpleCache" "~/Rncs/RHIS") 
#Combine the two:
repos=($repo_folder ${repo_individual[@]} $rpack_folder)

# Loop through all repos and add bin folder to path, if it exists:
for f in "${repos[@]}"
do
f=$(eval echo "$f") #expand
if [ -d "${f}bin" ]; then
export PATH=$PATH:${f}bin
fi
done

