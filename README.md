# env
Linux environment files

This repository contains a few files to set up a linux command line environment the way I like it.

This includes:

* aliases
* generic scripts
* PATH variable setup


# Installing environment settings

## New system installs (getting the prerequisites)
Start for a new system

	# First things first: make sure we have git
	sudo apt-get update
	sudo apt-get install -y git

	# Setting up github account global config options
	git config --global user.email "nsheff@users.noreply.github.com"
	git config --global user.name "nsheff"

	# Set up auth keys if you like
	# instructions:
	
	ssh-keygen -t rsa -b 4096 -C "identifier"
	
	# Now copy/paste that into GitHub
	 cat .ssh/id_rsa.pub

Link for adding new ssh key: https://github.com/settings/ssh

## Run basic configuration

Use one of the scripts in [system/](system) like [system/basicSetup.sh](system/basicSetup.sh)

## Cloning the repo and setting up
Start from here if you already have git set up how you want it

	# To clone this repository:
	mkdir -p code
	cd code
	git clone git@github.com:nsheff/env.git
	
	# Add a line like this into your .bashrc:
	# source path/to/repo/env/bashsetup.sh
	cd
	echo 'source ~/code/env/bashsetup.sh' >> .bashrc
	# Set up environment variables by pasting template `bash_vars_template.sh` # into your `.bashrc` Then adjust variables for this system.
	cat ~/code/env/bash_vars_template.sh >> .bashrc

## Basic utilities

Most of the stuff now can be solved by bulker. But there are a few things I want to install natively.

Install a sane file manager:

```
sudo apt-get install spacefm
```

sudo install python3-pip
pip install bulker
bulker load databio/nsheff
export PATH=~/.local/bin:$PATH


Install docker. You have to follow the current docker instructions because the way they suggest you install it changes every few months.

## Establish some links

Link tomboy notes:
Link .Rprofile:

	ln -s -i ${CODEBASE}env/dotfiles/.Rprofile $HOME/.Rprofile

	ln -s -i ~/Dropbox/.tomboy ~/.local/share/tomboy
	ln -s -i $SYNCDIR/env/sshconfig .ssh/config

Link atom theme:

	ln -s -i ~/code/env/ns-atom-syntax/ ~/.atom/packages/ns-syntax
	ln -s -i $SYNCDIR/env/default.xml ~/.config/inkscape/keys/default.xml

Link workrave stats:

	ln -s -i ~/Dropbox/env/historystats ~/.workrave/historystats

Link gedit preferences

	ln -s -i ~/Dropbox/env/.rgedit-preferences ~/.rgedit-preferences

Add launchers to menu so they can be dragged to quicklaunch panel:

	cd ~/code/env/launch
	./linkLaunchers.sh
	
Add pointer to env Makefile

	echo 'include ~/Dropbox/env/Makefile' >> Makefile

Link in inkscape short keys

	ln -s -i ~/code/env/dotfiles/inkscape_keys.xml .config/inkscape/keys/default.xml

## Some manual installs:
* [Docker](https://docs.docker.com/ee/docker-ee/ubuntu/)
* [Skype]()
* [Virtualbox]() ?

## Clone my repos
	cd code
	git clone git@github.com:nsheff/docker
