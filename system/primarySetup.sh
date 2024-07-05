
sudo apt-get install virtualbox spacefm htop

# Rgedit:
# http://heanet.dl.sourceforge.net/project/rgedit/rgedit-0.8.0.2-Gtk3-Python3.tar.bz2
# I had to update gedit to 3+, then this:

sudo apt-get purge gedit
sudo apt-get purge gedit-common
sudo apt-get install gedit-common/trusty
sudo apt-get install gedit/trusty

mkdir ~/.local/share/gedit/plugins
cd ~/.local/share/gedit/plugins
wget http://heanet.dl.sourceforge.net/project/rgedit/rgedit-0.8.0.2-Gtk3-Python3.tar.bz2
tar -xf rgedit-0.8.0.2-Gtk3-Python3.tar.bz2

sudo apt-get update && apt-get install -y \
texlive-latex-base \
ttf-mscorefonts-installer \


# work tools
samtools
libgsl0-dev #Gnu scientific library; MotIV needs it.

#workrave
#I put the .workrave folder in home to keep statistics, then add it to startup applications

#rgedit


#cinnamon PPA
#from http://www.webupd8.org/2014/06/new-cinnamon-stable-ubuntu-ppas-ubuntu.html
sudo add-apt-repository ppa:lestcape/cinnamon
sudo apt-get update
sudo apt-get install cinnamon


#after adding a ppa:
sudo apt-get install mendeleydesktop

faad calibre

