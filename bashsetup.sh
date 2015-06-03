# Source this in .bashrc
#cd "${BASH_SOURCE%/*}" || exit
# Bash source makes these relative to this script.
source ${BASH_SOURCE%/*}/repo_paths.sh
source ${BASH_SOURCE%/*}/alias_git.sh
source ${BASH_SOURCE%/*}/alias_docker.sh
source ${BASH_SOURCE%/*}/alias_slurm.sh
source ${BASH_SOURCE%/*}/alias_bash.sh
