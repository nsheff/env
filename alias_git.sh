# Nathan's quick git aliases.
# To use these, just source this file in your .bashrc

alias gco="git checkout master"
alias gdn="git diff HEAD --name-only; git ls-files --others --exclude-standard"
alias gd="git diff HEAD"
alias ga="git add"
alias gst="git status"
#alias gau="!git add $(git ls-files -o --exclude-standard)"
alias gcm="git commit -m"
alias gpom="git push origin master"
alias gpoh="git push origin HEAD"


alias gpa="git push --all"
alias gpo="git push origin"
alias glop="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short | column -ts'|' | less -r"
alias gr='git remote -vv'
alias gb='git branch -vv'


alias gprh="git push riv HEAD"  # push-to-deploy to rivanna
# git clone alias
# add --recursive so it will grab submodules as well by default.
gclo() {
	git clone git@github.com:$1 --recursive
}

gpu() {
git pull origin $(git rev-parse --abbrev-ref HEAD)
}

gpur() {
git pull origin $(git rev-parse --abbrev-ref HEAD) --rebase
}



# Creates a new project from the databio/newproject template.
# First, create the repository in the databio group. Then run this function
# Run like: newproject projectname
newproject() {
	PROJ=$1
	if [[ $# -eq 0 ]] ; then
	    echo 'run like: newproject projectname'
	    return 0
	fi
	echo "Creating a new repository for project ${PROJ}"
	gclo databio/newproject
	mv newproject ${PROJ}
	cd ${PROJ}
	rm Makefile
	echo "# ${PROJ}" > README.md
	rm -rf .git
	git init
	git add .
	git commit -m "Initialize project template"
	git remote add origin git@github.com:databio/${PROJ}.git
	git push -u --force origin master
	cd ..
}