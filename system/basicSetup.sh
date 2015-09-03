# TO clone this repository: 
git clone https://github.com/sheffien/env.git

# Add atom PPA: 
sudo add-apt-repository ppa:webupd8team/atom

sudo apt-get update

sudo apt-get install \
  git \
  sshfs \
  nautilus-open-terminal \
  tomboy \
  atom \
  byobu \
  vim \
  chromium-browser \

sudo apt-get install -y audacious 
sudo apt-get install -y gedit 
sudo apt-get install -y gedit-latex-plugin 
sudo apt-get install -y gedit-plugins 
sudo apt-get install -y inkscape 
 



# Dropbox
#in nemo, it's better to just install from the website; I've never had any luck installing from repos. But the web download and install work perfectly for me multiple times.
#https://www.dropbox.com/install

#Dropbox
#https://www.dropbox.com/install?os=lnx
#you then ALSO have to install the ubuntu package, so it knows it has it, then nemo-dropbox.
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# To create 
~/.dropbox-dist/dropboxd
sudo apt-get install nemo-dropbox

#remove dumb packages
sudo apt-get remove rhythmbox
sudo apt-get remove unity-lens-shopping
sudo apt-get remove unity-scope-musicstores



#install from website:
#skype

#move tomboy to dropbox folder
rm -rf .local/share/tomboy/
ln -s ~/Dropbox/.tomboy .local/share/tomboy

# move workrave to dropbox:
rm -rf .workrave
ln -s ~/Dropbox/.workrave ~/.workrave



# Firefox extensions:

# Xmarks can't be installed automatically
# FOr this we have to do it this way:

ext=2410
wget https://addons.mozilla.org/firefox/downloads/latest/${ext}/addon-${ext}-latest.xpi
firefox addon-2410-latest.xpi


# From: http://askubuntu.com/q/73474
# For addBlock
firefoxExtDir="~/.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
mkdir ~/.mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}

mkdir ~/extensions
cd ~/extensions
ext=2410


wget https://addons.mozilla.org/firefox/downloads/latest/${ext}/addon-${ext}-latest.xpi
unzip ~/extensions/addon-${ext}-latest.xpi
rm ~/extensions/addon-${ext}-latest.xpi


#!/bin/sh
var=`grep -m 1 -e em:id install.rdf`
echo $var
var=${var#*\>}
var=${var%<*}

mkdir ${firefoxExtDir}/$var
mv *  ${firefoxExtDir}/$var
