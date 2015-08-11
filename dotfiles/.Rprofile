# Choose bioconductor mirror:
oldTimeout = options(timeout = 3) # lower timout
tryCatch( {
	source("http://bioconductor.statistik.tu-dortmund.de/biocLite.R")
}, error = function(e) { 
	message("Unable to connect to local bioconductor mirror, using default." )
	source("http://bioconductor.org/biocLite.R")
})
options(oldTimeout)

# Set global options
options(menu.graphics=FALSE);
options(echo=TRUE);
options(stringsAsFactors=FALSE);

# Set up base directory for shared util functions:
homeDir = Sys.getenv("HOME")
options(PROJECT.DATA.BASE = "/fhgfs/groups/lab_bock/shared/projects/")
options(RESOURCE.DIR="/data/groups/lab_bock/shared/resources/")
options(PROJECT.CODE.BASE=paste0(homeDir, "/repo/"))

# old method (will be removed in the future)
options(SHARE.DIR="/data/groups/lab_bock/shared/resources/")
options(SHARE.RUTIL.DIR="~/rpack/RGenomeUtils/R/")


#source(paste0(getOption("SHARE.DIR"), "project.init.R"))
library(project.init)
