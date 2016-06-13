#! /usr/bin/python

"""
Project switcher. Assuming each project is a subfolder under environment variable
folder $CODEBASE, this script will list all those projects, allow the user to select
one, and set the that project string to the PROJ variable in the current shell.
Essentially, this minimizes keystrokes to let you easily manually pick a project string,
which you can then use in the shell.

Use with sp.sh to set the shell variables.

"""

from __future__ import print_function
import os
import sys

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


projects = ["ews_patients", "epigenome_compendium"]
project_dir = os.path.expanduser(os.environ["CODEBASE"])

subfolders = [item for item in os.walk(project_dir).next()[1]]
projects = sorted(subfolders, key=str.lower)

for i, p in enumerate(projects):
	eprint(i, p)

eprint("Enter a project number:")
pn = int(raw_input())

print(projects[pn])

