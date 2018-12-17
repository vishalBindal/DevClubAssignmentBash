#!/bin/bash

#checking for errors
if [ $# -ne 1 ]
then
#echo "Invalid no"
exit -1
elif [[ $1 != *.txt ]]
then
#echo "invalid format"
exit -1
elif [ ! -f $1 ]
then
#echo "File doesn't exist"
exit -1
fi

#variables
num=
oprtn=
ans=0
line="0"
i=1

#executing loop till all lines are read
while [ "$line" != "" ]
do
#reading 'i'th line
	line=$(cut -d$'\n' -f $i $1)
#checking if line is empty
	if [ "$line" != "" ]
	then
#reading value of number
	num=$(echo $line | cut -d " " -f 1)
#checking if operator is *, because it is causing problems
	if [ "$line" = "$num *" ]
	then
		oprtn='m'
	else
#reading operator in other cases
		oprtn=$(echo $line | cut -d " " -f 2)
	fi
#incrementing i
	i=$((i+1))
#calculating ans for this step
	case $oprtn in
	+ ) ans=$((ans+num));;
	- ) ans=$((ans-num));;
	m ) ans=$((ans*num));;
	/ ) ans=$((ans/num));;
	esac
	fi
done 

echo $ans

exit 0
