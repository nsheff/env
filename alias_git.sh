# Nathan's quick git aliases.
# To use these, just source this file in your .bashrc

alias gco="git checkout master"
alias gpr="git pull origin HEAD --rebase"
alias gdn="git diff HEAD --name-only; git ls-files --others --exclude-standard"
alias gd="git diff HEAD"
alias ga="git add"
alias gst="git status"
#alias gau="!git add $(git ls-files -o --exclude-standard)"
alias gcm="git commit -m"
alias gpom="git push origin master"
alias gpoh="git push origin HEAD"
alias gprh="git push riv HEAD"  # push-to-deploy to rivanna

alias gpa="git push --all"
alias gpo="git push origin"
alias glop="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short | column -ts'|' | less -r"
alias gr='git remote -vv'
alias gb='git branch -vv'

gar()
{
	PWD=`pwd`
	BN=`basename $PWD`
	git remote add riv rivi:code/${BN}/.git
}

# git clone alias
gclo() 
{
	git clone git@github.com:$1
}
