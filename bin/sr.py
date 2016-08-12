#! /usr/bin/python

"""
Remote switcher. 

"""

from __future__ import print_function
import os
import sys, re

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# Method one: list your remotes here
#projects = ["ews_patients", "epigenome_compendium"]

# Method 2: each subfolder in a provided directory is a project
project_dir = os.path.expanduser(os.environ["REMOTES"])

subfolders = [re.sub(".sh$","", item) for item in os.walk(project_dir).next()[2]]

remotes = sorted(subfolders, key=str.lower)
for i, p in enumerate(remotes):
	eprint(i, p)

eprint("Enter a remote number:")
pn = int(raw_input())

print(remotes[pn])

