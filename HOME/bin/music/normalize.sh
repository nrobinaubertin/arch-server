#!/bin/sh
#normalize filenames

if [[ -f $1 ]]
then
	old=$1
	new=`echo $1 | tr "àçéèêëîïôöùüÂÇÉÈÊËÎÏÔÖÙÜ" "aceeeeiioouuACEEEEIIOOUU"`
	new=`echo $new | tr -d '"'`
	new=`echo $new | tr -d "'"`
	new=`echo $new | tr " #,;:<>?!§*&-([)]}{=+" "_____________________"`
	new=`echo $new | tr -s "_"`
	if [[ $old != $new ]]
	then
		echo "rename $old to $new"
		mv "$old" "$new"
	fi
fi

if [[ -d $1 ]]
then
	echo "$1"
	old=$1
	next=`echo "$old"`
	new=`echo $1 | tr "àçéèêëîïôöùüÂÇÉÈÊËÎÏÔÖÙÜ" "aceeeeiioouuACEEEEIIOOUU"`
	new=`echo $new | tr -d '"'`
	new=`echo $new | tr -d "'"`
	new=`echo $new | tr " #,;:<>?!§*&-([)]}{=+" "_____________________"`
	new=`echo $new | tr -s "_"`
	if [[ $old != $new ]]
	then
		echo "rename directory from $old to $new"
		mv "$old" "$new"
		next=`echo "$new"`
	fi

	for i in $next/*
	do
		$0 "$i"
	done
fi
