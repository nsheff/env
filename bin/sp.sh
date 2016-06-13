# Project switcher. Uses python (sp.py) to set bash env variable PROJ

echo "Current project: $PROJ"
PROJ=`sp.py`

export PROJ
echo "Activated project: $PROJ"
