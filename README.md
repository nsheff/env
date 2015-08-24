# env
Linux environment files

This repository contains a few files to set up a linux command line environment the way I like it.

This includes:

* aliases
* generic scripts
* PATH variable setup


# Installing

Just clone the repo, and then install the individual components like this:

### Bash setup

Add a line like this into your .bashrc:

	source path/to/repo/env/bashsetup.sh


Now, set up a few required environment variables by pasting the variables from `bash_vars_template.sh` into your local `.bashrc`, adjusting the variables as appropriate for this system.

### Link .Rprofile:
	ln -s -i ~/repo/env/dotfiles/.Rprofile ~/.Rprofile

### Link tomboy notes:
	ln -s -i ~/Dropbox/.tomboy ~/.local/share/tomboy

### Link atom theme:
	ln -s ~/repo/env/ns-atom-syntax/ ~/.atom/packages/ns-syntax
