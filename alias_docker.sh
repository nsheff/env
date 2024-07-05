
alias dr="docker run"

# Delete all old containers
alias dclean="docker ps -a | grep 'months ago' | awk '{print $1}'  | xargs --no-run-if-empty docker rm"
