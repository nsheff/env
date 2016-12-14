# Create mountpoints if they don't already exist
if [ ! -d "/scratch/ns5bc" ]; then
	echo "Must create mountpoint"
	sudo mkdir /scratch/ns5bc
	sudo chown `whoami`:`whoami` /scratch/ns5bc
fi
if [ ! -d "/data" ]; then
	sudo mkdir /data
	sudo chown `whoami`:`whoami` /data
fi

# Mount remote filesystems
sshfs rivi:/scratch/ns5bc /scratch/ns5bc

# Set up convenience softlinks
ln -si /scratch/ns5bc ~/riv

#sshfs n002:/home/nsheffield cemm #don't do this!