#!/bin/sh
#====================================================================================================
#
# Builds all chipper-like simulations.
# This must be run from the main "git" directory (the parent of all simulation/chipper repo directories)
# Usage: chipper/bin/all-build.sh
#                                     (named all-build because I like build.sh to
#                                      be tab-completed easily. lazy? yes)
#
# Author: Jonathan Olson
#
#====================================================================================================

for sim in `cat chipper/data/active-sims | xargs`
do
  if [ -d "$sim" ]; then
    echo -n "Building" $sim "..."
    cd $sim                 	# build.sh needs to be run from the sim directory
    npm install > build.log    # executes quickly when everything is up to date compared to build.sh
    grunt $1 > build.log 	# run the build
    if [ -f build/$sim_en.html ]; then #check success by existance of built file
	   echo "OK"
    else
	    echo "KO. Watch $sim/build.log for more details";
    fi

    cd ..                   	# and back to the original directory
  fi
done
