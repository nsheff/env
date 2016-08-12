# Remote switcher. Uses python (sr.py) to set bash env variables for
# different remotes

echo "Current remote: $REMOTE"
REMOTE=`sr.py`

source ${REMOTES}/${REMOTE}.sh
echo "Activated remote: $REMOTE"
