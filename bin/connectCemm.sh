# Create mountpoints if they don't already exist
if [ ! -d "/fhgfs" ]; then
	echo "Must create mountpoint"
	sudo mkdir /fhgfs
	sudo chown `whoami`:`whoami` /fhgfs
fi
if [ ! -d "/data" ]; then
	sudo mkdir /data
	sudo chown `whoami`:`whoami` /data
fi

# Mount remote filesystems
sshfs n002:/fhgfs /fhgfs
sshfs n002:/data /data

# Set up convenience softlinks
ln -si /data/home/nsheffield ~/cemm

#sshfs n002:/home/nsheffield cemm #don't do this!
