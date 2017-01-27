# Some aliases to make it more easy to interact with projects
# using looper.

# looper check
lc() {
	config=`ls $CODEBASE/$1/metadata/*.yaml`
	cmd="looper check $config ${@:2}"
	echo $cmd
	${cmd}
}

# looper run
lr() {
	config=`ls $CODEBASE/$1/metadata/*.yaml`
	cmd="looper run $config ${@:2}"
	echo $cmd
	${cmd}
}

# looper summarize
lsum() {
	config=`ls $CODEBASE/$1/metadata/*.yaml`
	cmd="looper summarize $config ${@:2}"
	echo $cmd
	${cmd}
}
