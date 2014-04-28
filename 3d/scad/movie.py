#!/usr/bin/python

import os, sys, math
from subprocess import Popen, PIPE

def deg2rad(deg):
    return deg*math.pi/180.0;

def runProcess(command):
    process = Popen(command.split(' '), stdout=PIPE, stderr=PIPE)
    (output, err) = process.communicate()
    exit_code = process.wait()

    return output

def generateFrame(x, y, z, filename):
    runProcess("openscad spidey.csg -o %s --imgsize=1024,576 --camera=%g,%g,%g,0,0,0"
               % (filename,x,y,z))

def frameForAngle(alpha, filename):
    generateFrame(math.cos(alpha)*300, math.sin(alpha)*300, math.cos(alpha)*300, filename)

for alpha in range(0,360):
    print('Generating frame %d...' % alpha)
    frameForAngle(deg2rad(alpha), 'movie-out/%05d.png' % alpha)

print('Encoding the video')
runProcess('ffmpeg -i movie-out/%05d.png -b 8M -vcodec mpeg4 movie-out/movie.mp4')
