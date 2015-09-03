# Add atom PPA: 
sudo add-apt-repository ppa:webupd8team/atom

sudo apt-get update && sudo apt-get install \
  git \
  sshfs \
  nautilus-open-terminal \
  gedit-latex-plugin \
  gedit-plugins \
  tomboy \
  inkscape \
  atom \
  byobu \
  audacious \
  vim \
  chromium-browser \





# Dropbox
#in nemo, it's better to just install from the website; I've never had any luck installing from repos. But the web download and install work perfectly for me multiple times.
#https://www.dropbox.com/install

#Dropbox
#https://www.dropbox.com/install?os=lnx
#you then ALSO have to install the ubuntu package, so it knows it has it, then nemo-dropbox.
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd


#remove dumb packages
sudo apt-get remove rhythmbox
sudo apt-get remove unity-lens-shopping
sudo apt-get remove unity-scope-musicstores



#install from website:
#skype

#move tomboy to dropbox folder
rm -rf .local/share/tomboy/
ln -s ~/Dropbox/.tomboy .local/share/tomboy



