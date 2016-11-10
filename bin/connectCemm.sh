# Create mountpoints if they don't already exist
if [ ! -d "/scratch" ]; then
	echo "Must create mountpoint"
	sudo mkdir /scratch
	sudo chown `whoami`:`whoami` /scratch
fi
if [ ! -d "/data" ]; then
	sudo mkdir /data
	sudo chown `whoami`:`whoami` /data
fi

# Mount remote filesystems
sshfs cemm:/scratch /scratch
sshfs cemm:/data /data
#sshfs cemm:/fhgfs /fhgfs -o auto_cache -o reconnect -o Ciphers=arcfour -o cache_timeout=115200 -o attr_timeout=115200 -o entry_timeout=1200 -o max_readahead=90000 -o large_read -o big_writes -o no_remote_lock

#sshfs cemm:/data /data  -o auto_cache -o reconnect -o Ciphers=arcfour -o cache_timeout=115200 -o attr_timeout=115200 -o entry_timeout=1200 -o max_readahead=90000 -o large_read -o big_writes -o no_remote_lock

# Set up convenience softlinks
ln -si /data/home/nsheffield ~/cemm

#sshfs n002:/home/nsheffield cemm #don't do this!