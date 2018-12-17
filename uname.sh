#!/bin/bash

#checking for errors
if [ $# -ne 2 ]
then
#echo "invalid no"
exit -1
elif [ ! -f $1 ]
then
#echo "file doesnt exist"
exit -1
elif [[ $1 != *.txt ]]
then
#echo "invalid format"
exit -1
fi

#picking the line which contains $2, and printing 5th field with : as delim
grep "$2" $1 | cut -d':' -f5

exit 0 



