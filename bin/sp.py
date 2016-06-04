#! /usr/bin/python
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

