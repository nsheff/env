# Nathan's quick git aliases.
# To use these, just source this file in your .bashrc

alias gco="git checkout master"
alias gpr="git pull --rebase"
alias gdn="git diff HEAD --name-only; git ls-files --others --exclude-standard"
alias gd="git diff HEAD"
alias ga="git add"
alias gst="git status"
#alias gau="!git add $(git ls-files -o --exclude-standard)"
alias gcm="git commit -m"
alias gpom="git push origin master"
alias gpo="git push origin"
alias glop="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short | column -ts'|' | less -r"

