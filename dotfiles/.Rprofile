# Set global options
#options(echo=TRUE)
options(menu.graphics=FALSE)
options(stringsAsFactors=FALSE)

# Load projectInit (if installed)
tryCatch( {
    library(projectInit)
}, error = function(e) {
    message(e)
})

# Start up bioconductor
bc = function() {
	source("https://bioconductor.org/biocLite.R")
}

# My function to initialize setup
go = function() {
	message("Initializing packages...")
	
	library(data.table, quietly=TRUE)
	library(projectInit)
	library(simpleCache)
	library(RGenomeUtils)
	library(devtools)
	library(ggplot2)
}

# Install RGenomeUtils
irgu = function() {
	install.packages("/code/RGenomeUtils", repos=NULL)
}
