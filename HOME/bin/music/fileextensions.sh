#!/bin/sh
#get extensions of files (to get statistics)

#tmp file
if [[ $2 == "" ]]
then
tmp=`mktemp`
else
tmp=`echo $2`
fi


if [[ -f $1 ]]
then
	echo "$1" | sed 's/.*\.//' >> "$tmp"
fi

if [[ -d $1 ]]
then
	#echo "$1"
	for i in $1/*
	do
		$0 "$i" "$tmp"
	done
fi

if [[ $2 == "" ]]
then
cat $tmp | sort | uniq -c >&1
fi
