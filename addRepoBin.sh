
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
if [ -d "${f}bin" ]; then
export PATH=$PATH:${f}bin
fi
done

