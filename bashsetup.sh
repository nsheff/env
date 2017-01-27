# Source this in .bashrc by adding this line to ~/.bashrc:
# source ~/code/env/bashsetup.sh

# ${BASH_SOURCE%/*} makes these paths relative to this script.
source ${BASH_SOURCE%/*}/repo_paths.sh
source ${BASH_SOURCE%/*}/alias_git.sh
source ${BASH_SOURCE%/*}/alias_docker.sh
source ${BASH_SOURCE%/*}/alias_slurm.sh
source ${BASH_SOURCE%/*}/alias_bash.sh
source ${BASH_SOURCE%/*}/alias_project.sh
source ${BASH_SOURCE%/*}/alias_looper.sh
export REMOTES=${BASH_SOURCE%/*}/remotes
