#!/bin/bash

# Get number of processors: `getconf _NPROCESSORS_ONLN`
# or `nproc` or `grep -c ^processor /proc/cpuinfo ` will work.
#
# You can use it with make!
# make -j$(getconf _NPROCESSORS_ONLN)

echo $(getconf _NPROCESSORS_ONLN)
