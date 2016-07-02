# Aliases for project management
# This script defines a bunch of routines that just let 
# you switch active projects, and then control syncing
# that project among local and remote servers.

# switch-project; function for setting active projects
sp() {
	source sp.sh
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
	rsync -av ${REMOTE}:~/linkto/process/${PROJ}/*.tsv ${LPROCESSED}${PROJ}/
}

# push code and metadata to remote server
p.code() {
	echo ${PROJ}
	rsync -av ~/code/${PROJ}/src/. ${REMOTE}:~/code/${PROJ}/src/
	rsync -av $CODEBASE/${PROJ}/metadata/. ${REMOTE}:~/code/${PROJ}/metadata/
}

# push everything!
p.all() {
	echo ${PROJ}
	rsync -av $CODEBASE/${PROJ}/. ${REMOTE}:~/code/${PROJ}/
}

# grab analysis results from remote server
p.res() {
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/results_analysis/ ${LPROCESSED}${PROJ}/results_analysis/
}

# grab fastqc pipeline results from remote server
p.rep() { 
	echo ${PROJ}
	rsync -av ${REMOTE}:${PROCESSED}${PROJ}/results_pipeline/*/fastq/*.html ${LPROCESSED}${PROJ}/results_pipeline/
}

# convert svg into pdf/png figures
p.fig() {
	${CODEBASE}/scripts/misc/svg2pdfpng ~/Dropbox/${PROJ}/Figures/SVG/*.svg
}


# publish web page to webserver
p.web() {
	rsync -av $CODEBASE/${PROJ}/web/. ${REMOTE}:/data/groups/lab_bock/public_html/papers/${PROJ}/
}

p.sfm () {
	echo ${PROJ}
	folders=`fe ${HOME}/code/${PROJ} ${HOME}/code/${PROJ}/src ${HOME}/code/${PROJ}/metadata  ${HOME}/code/${PROJ}/results_analysis /fsl/data/${PROJ} ${LPROCESSED}${PROJ}`
	echo ${folders}
	spacefm -wn ${folders} & 
}
