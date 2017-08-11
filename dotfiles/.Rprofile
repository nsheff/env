biocLoaded=FALSE
if (FALSE) {
	# Use this section if you need to specify an alternative bioconductor mirror
	oldTimeout = options(timeout = 3) # lower timout
	tryCatch( {
		biocLoaded=TRUE
	}, error = function(e) { 
		message("Unable to connect to bioconductor mirror, using default." )
	})
	options(oldTimeout)
}
if (!biocLoaded) {
	source("http://bioconductor.org/biocLite.R")
}

# Set global options
options(menu.graphics=FALSE);
options(echo=TRUE);
options(stringsAsFactors=FALSE);

# Set environment variable connection to shared functions
options(RGENOMEUTILS="~/code/RGenomeUtils/")

# Load project.init (if installed)
tryCatch( {
	library(project.init)
}, error = function(e) {
	message(e)
})

# Load common packages
message("init packages...");
library(devtools)
library(data.table, quietly=TRUE)
library(extrafont)
library(simpleCache)
library(ggplot2)
library(RGenomeUtils)
