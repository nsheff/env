# Aliases for project management
# This script defines a bunch of routines that just let 
# you switch active projects, and then control syncing
# that project among local and remote servers.



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

# grab statistics from remote server
p.stat () {
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}/${PROJ}/*.tsv ${LPROCESSED}${PROJ}/
}

# push code and metadata to remote server
p.code() {
	echo ${PROJ}
	rsync -av ${LCODE}/${PROJ}/src/. ${REMOTE}:~/code/${PROJ}/src/
	rsync -av ${LCODE}/${PROJ}/metadata/. ${REMOTE}:~/code/${PROJ}/metadata/
}

# push everything!
p.all() {
	echo ${PROJ}
	rsync -av ${LCODE}/${PROJ}/. ${REMOTE}:~/code/${PROJ}/
}

# grab analysis results from remote server
p.res() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/results_analysis/ ${LPROCESSED}${PROJ}/results_analysis/
}

p.geo() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/geo_submission/*.tsv ${LPROCESSED}${PROJ}/geo_submission/
}

p.als() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/analysis/ ${LPROCESSED}${PROJ}/analysis/
}

p.ressmall() {
	echo ${PROJ}
	rsync -av --max-size=50m ${REMOTE}:${PROCESSED}${PROJ}/results_analysis/ ${LPROCESSED}${PROJ}/results_analysis/
}


p.gettype() {
	TYPE=$1
	echo ${TYPE}
	rsync -avr --include="${TYPE}" --include="*/" --exclude="*" ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline ${LPROCESSED}${PROJ}
}

p.getpl() {
	TYPE=$1
	echo ${TYPE}
	rsync -avr ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline ${LPROCESSED}${PROJ}
}


p.puttype() {
	TYPE=$1
	echo ${TYPE}
	rsync -avr --include="${TYPE}" --include="*/" --exclude="*" ${LPROCESSED}${PROJ} ${REMOTE}:${PROCESSED}
}

# grab fastqc pipeline results from remote server
p.rep() { 
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline/*/fastq/*.html ${LPROCESSED}${PROJ}/results_pipeline/
}

# grab ALL pipeline results from remote server (can take awhile!)
p.resall() { 
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline/ ${LPROCESSED}${PROJ}/results_pipeline/
}

# put ALL pipeline results to remote server
p.resallput() { 
	echo ${PROJ}
	rsync -av ${LPROCESSED}${PROJ}/results_pipeline/ ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline/ 
}

# convert svg into pdf/png figures
p.fig() {
	${LCODE}/scripts/misc/svg2pdfpng ~/Dropbox/${PROJ}/Figures/SVG/*.svg
}


# publish web page to webserver
p.web() {
	rsync -av ${LCODE}/${PROJ}/web/. ${REMOTE}:/data/groups/lab_bock/public_html/papers/${PROJ}/
}

p.sfm () {
	echo ${PROJ}
	folders=`fe ${HOME}/code/${PROJ} ${HOME}/code/${PROJ}/src ${HOME}/code/${PROJ}/metadata  ${HOME}/code/${PROJ}/results_analysis /fsl/data/${PROJ} ${LPROCESSED}${PROJ}`
	echo ${folders}
	spacefm -wn ${folders} & 
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