#!/bin/bash

#checking for errors
if [ $# -ne 2 ]
then 
#invalid no of arguments
exit -1
elif [ ! -d $1 -o ! -r $1 ]
then 
#directory 1 does not exist or is not readable
exit -1
elif [ ! -d $2 -o ! -r $2 ]
then
#directory 2 DOE or unreadable
exit -1
fi

file=

echo -n "Files copied from $1 to $2 are: "
#recursively storing path of files of directory $1 
for i in $(find $1 -type f)
do
#getting file name by 
#removing prefix (of path of directory $1) from path of file
file=${i#"$1"}
#checking if file is present in directory $2
if [ ! -f "$2/$file" ]
then
#copying file to directory $2
cp $i $2 
#removing "/" prefix from start of file name (if present)
file=${file#"/"}
echo -n "$file "
fi
done

echo 

#repeating process for vice-versa
echo -n "Files copied from $2 to $1 are: "
for i in $(find $2 -type f)
do
file=${i#"$2"}
if [ ! -f "$1/$file" ]
then
cp $i $1
file=${file#"/"}
echo -n "$file "
fi
done

echo

