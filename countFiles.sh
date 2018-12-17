#!/bin/bash

if [[ ($# -ne 1) && ($# -ne 2) ]]
then
exit -1

elif [[ (! -d $1) || (! -r $1) ]]
then
exit -1

elif [[ ("$2" != "."*) && ("$2" != "") ]]
then
exit -1
fi

find $1 -maxdepth 1 -type f -name "*$2" | wc -l

exit 0
