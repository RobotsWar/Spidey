#!/usr/bin/python

import os, sys, math, re, pickle
from subprocess import Popen, PIPE

def runProcess(command):
    process = Popen(command.split(' '), stdout=PIPE, stderr=PIPE)
    (output, err) = process.communicate()
    exit_code = process.wait()

    return err

output = runProcess("openscad spidey/spidey.scad -o /tmp/out.png")
allParts = re.findall('"\[PART\] (.+)"', output)
parts = {}

for part in allParts:
    if part in parts:
        parts[part] += 1
    else:
        parts[part] = 1

plater_conf = '# Auto-generated parts list'
for part in parts:
    plater_conf += "\n%s.stl %s" % (part, parts[part])

print(plater_conf)
