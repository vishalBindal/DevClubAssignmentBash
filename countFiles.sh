#!/bin/bash

#checking for errors
if [[ ($# -ne 1) && ($# -ne 2) ]]
then
#invalid no of arguments
exit -1

elif [[ (! -d $1) || (! -r $1) ]]
then
#path either does not exist or is not readable
exit -1

elif [[ ("$2" != "."*) && ("$2" != "") ]]
then
#extension, if  given, is invalid
exit -1
fi

#finding files of name *$2 in current directory
#and printing no of lines which were to be displayed by find command
find $1 -maxdepth 1 -type f -name "*$2" | wc -l

exit 0
