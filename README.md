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
	git config --global user.email "sheffien@users.noreply.github.com"
	git config --global user.name "sheffien"
	
	# Set up auth keys if you like

## Cloning the repo and setting up
Start from here if you already have git set up how you want it

	# TO clone this repository:
	mkdir -p repo
	cd repo
	git clone git@github.com:sheffien/env.git

	# Add a line like this into your .bashrc:
	# source path/to/repo/env/bashsetup.sh
	echo 'source ~/repo/env/bashsetup.sh' >> .bashrc
	
	# Set up environment variables by pasting template `bash_vars_template.sh` into your `.bashrc`
	# Then adjust the variables as appropriate for this system.
	cat ~/repo/env/bash_vars_template.sh >> .bashrc

## Establish some links
Link .Rprofile:

	ln -s -i ~/repo/env/dotfiles/.Rprofile ~/.Rprofile

Link tomboy notes:

	ln -s -i ~/Dropbox/env/.tomboy ~/.local/share/tomboy
	ln -s -i ~/Dropbox/env/sshconfig .ssh/config

Link atom theme:

	ln -s -i ~/repo/env/ns-atom-syntax/ ~/.atom/packages/ns-syntax

Link workrave stats:

	ln -s -i ~/Dropbox/env/historystats ~/.workrave/historystats

Link gedit preferences

	ln -s -i ~/Dropbox/env/.rgedit-preferences ~/.rgedit-preferences

Add launchers to menu so they can be dragged to quicklaunch panel:

	cd ~/repo/env/launch
	./linkLaunchers.sh

## Some manual installs:
* [Docker](https://docs.docker.com/installation/ubuntulinux/#installation)
* [SKype]()
* [Virtualbox]() ?

## Clone my repos
	cd repo
	git clone git@github.com:sheffien/docker


