# Add atom PPA: 
sudo add-apt-repository ppa:webupd8team/atom

# It's fun to include these all in 1 command using slashes to put the packages on different lines,
# but the advantage of individual commands is that if one package fails, the others will still be installed.
# It also makes subsetting easier

sudo apt-get install -y sshfs
sudo apt-get install -y nautilus-open-terminal
sudo apt-get install -y tomboy
sudo apt-get install -y atom
sudo apt-get install -y byobu
sudo apt-get install -y vim
sudo apt-get install -y chromium-browser

sudo apt-get install -y workrave
sudo apt-get install -y audacious 
sudo apt-get install -y gedit 
sudo apt-get install -y gedit-latex-plugin 
sudo apt-get install -y gedit-plugins 
sudo apt-get install -y inkscape
sudo apt-get install -y jabref

# Docker
# From: https://docs.docker.com/installation/ubuntulinux/#installation
sudo apt-get install -y docker
sudo usermod -aG docker ubuntu

 
# Dropbox
# It's best to install from the website; I've never had any luck installing from repos.
# https://www.dropbox.com/install
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# To create a user:
~/.dropbox-dist/dropboxd

# you then ALSO have to install the ubuntu package, so it knows it has it, then nemo-dropbox.
sudo apt-get install nemo-dropbox

# Remove dumb packages
sudo apt-get remove rhythmbox
sudo apt-get remove unity-lens-shopping
sudo apt-get remove unity-scope-musicstores


# Install from website:
# Skype

# Create startup applications by moving launchers to autostart area.
cp launch/StartWorkrave.desktop ~/.config/autostart
cp launch/StartDropbox.desktop ~/.config/autostart

# Firefox extensions: (This section needs to be cleaned up and polished)

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


# Display
# I had trouble getting dual monitors working in Linux Mint; it worked much better when I switched
# from proprietary nvidia drivers to Xorg drivers, then the normal Display menu worked (and you can put
# the menu bar on the other monitor by right-clicking and pressing "move")


