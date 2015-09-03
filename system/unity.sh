# Making unity bearable

# Switch from nautilus to nemo
sudo apt-get install unity-tweak-tool \
  nemo

# From: 
# http://askubuntu.com/questions/260244/make-nemo-the-default-file-browser
# http://askubuntu.com/questions/285461/how-to-get-nautilus-real-compact-mode-in-ubuntu-13-04
# http://askubuntu.com/questions/605275/how-to-set-nemo-as-default-instead-of-nautilus
sudo mv /usr/bin/nautilus /usr/bin/nautilus.back && sudo ln -s /usr/bin/nemo /usr/bin/nautilus

#gsettings set org.gnome.desktop.background show-desktop-icons false
#gsettings set org.nemo.desktop show-desktop-icons true
#xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search




