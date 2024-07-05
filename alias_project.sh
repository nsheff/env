# Aliases for project management
# This script defines a bunch of routines that just let 
# you switch active projects, and then control syncing
# that project among local and remote servers.

# Converts markdown to txt format
md2txt() {
	pandoc -s `ls -1vr $1*` \
	-t plain \
	--wrap=none \
	--bibliography $bib \
	--csl $csl | sed 's/^_//g;s/\([^A-Za-z0-9]\)_/\1/g;s/_\([^A-Za-z0-9]\)/\1/g' > output/$1.txt
}

# switch-project; function for setting active projects
sp() {
	source sp.sh
}

# switch-remote;
sr() {
	source sr.sh
}

# does folder exist?
fe () {
for var in "$@"
do
if [ -e "$var" ]
then
	echo -n "$var "
else
	echo " "
fi
done
}

export -f fe

# default to current folder
# by calling this before each of my project functions, if $PROJ is not set,
# it will assume I'm in the subfolder for the project.
setproject() {

	if [ -z ${PROJ} ]; then
		wd=`pwd`
		export PROJ=`basename $wd`;
		echo "setting PROJ to $PROJ"
	else echo "PROJ is already set to '$PROJ'"; fi

}

# grab statistics from remote server
p.stat() {
	setproject
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}/${PROJ}/*.tsv ${PROCESSED}${PROJ}/
}

# push code and metadata to remote server
p.code() {
	echo ${PROJ}
	rsync -av ${CODE}/${PROJ}/src/. ${REMOTE}:~/code/${PROJ}/src/
	rsync -av ${CODE}/${PROJ}/metadata/. ${REMOTE}:~/code/${PROJ}/metadata/
}

# push everything!
p.all() {
	setproject
	echo ${PROJ}
	rsync -av ${CODE}/${PROJ}/. ${REMOTE}:~/code/${PROJ}/
}

p.forcesync() {
	setproject
	echo ${PROJ}
	rsync -av --delete ${CODE}/${PROJ}/. ${REMOTE}:~/code/${PROJ}/
}

# grab analysis results from remote server
p.res() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_analysis/ ${PROCESSED}${PROJ}/results_analysis/
}

p.geo() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/geo_submission/*.tsv ${PROCESSED}${PROJ}/geo_submission/
}

p.als() {
	setproject
	mkdir -p ${PROCESSED}${PROJ}/analysis/
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/analysis/ ${PROCESSED}${PROJ}/analysis/
}

p.linkproc() {
	setproject
	echo ${PROJ}
	python ${CODEBASE}scripts/misc/linkme.py ${PROCESSED}${PROJ}/results_pipeline/
}

p.ressmall() {
	echo ${PROJ}
	rsync -av --max-size=50m ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_analysis/ ${PROCESSED}${PROJ}/results_analysis/
}


p.gettype() {
	setproject
	TYPE=$1
	echo ${TYPE}
	rsync -avr --include="${TYPE}" --include="*/" --exclude="*" ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_pipeline ${PROCESSED}${PROJ}
}

p.getpl() {
	TYPE=$1
	echo ${TYPE}
	rsync -avr ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_pipeline ${PROCESSED}${PROJ}
}


p.puttype() {
	TYPE=$1
	echo ${TYPE}
	rsync -avr --include="${TYPE}" --include="*/" --exclude="*" ${PROCESSED}${PROJ} ${REMOTE}:${REMOTE_PROCESSED}
}

# grab fastqc pipeline results from remote server
p.rep() { 
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_pipeline/*/fastq/*.html ${PROCESSED}${PROJ}/results_pipeline/
}

# grab ALL pipeline results from remote server (can take awhile!)
p.resall() { 
	echo ${PROJ}
	rsync -av ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_pipeline/ ${PROCESSED}${PROJ}/results_pipeline/
}

# put ALL pipeline results to remote server
p.resallput() { 
	echo ${PROJ}
	rsync -av ${PROCESSED}${PROJ}/results_pipeline/ ${REMOTE}:${REMOTE_PROCESSED}${PROJ}/results_pipeline/ 
}

# convert svg into pdf/png figures
p.fig() {
	setproject
	${CODE}/scripts/misc/svg2pdfpng ~/Dropbox/${PROJ}/Figures/SVG/*.svg
}

p.sfm () {
	echo ${PROJ}
	folders=`fe ${HOME}/code/${PROJ} ${HOME}/code/${PROJ}/src ${HOME}/code/${PROJ}/metadata  ${HOME}/code/${PROJ}/results_analysis /fsl/data/${PROJ} ${PROCESSED}${PROJ}`
	echo ${folders}
	spacefm -wn ${folders} & 
}


# ------------------------------------------------------------------------------
# Backup functions (remote push/pull functions)

# Given a variable, like DATA, this will construct an rsync command to sync
# the remote version to the local version
# use like: `remotepull DATA`
remotepull() {
	if [ -e ${!1} ]
	then
	REMOTE_VAR="REMOTE_${1}"
	cmd="rsync -av ${REMOTE}:${!REMOTE_VAR} ${!1}"
	echo $cmd
	($cmd)
	else
	echo "${!1} does not exist."
	fi
}


remotepush() {
	REMOTE_VAR="REMOTE_${1}"
	cmd="rsync -av ${!1} ${REMOTE}:${!REMOTE_VAR}"
	echo $cmd
	$(cmd)
}



# Load remote R sessions
R.rcemm () {
	ssh -tX cemm salloc -t 0-8 -p develop --mem=16000 -w n002 "R --no-save --no-restore"
}

R.rcemmbigmem () {
	ssh -tX cemm salloc -t 0-8 -p develop --mem=48000 -w n002 "R --no-save --no-restore"
}

R.rcemmbigmem () {
	ssh -tX cemm salloc -t 0-8 -p develop --mem=48000 -w n002 "bash"
}

R.rrivi () {
	ssh -tX rivi "R --no-save --no-restore"
}

R.rriviint () {
	# On the interactive node
	ssh -tX rivi salloc -t 0-9 -p economy --mem=16000 "R --no-save --no-restore"
}