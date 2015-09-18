#!/usr/bin/bash

cd "$1"
for i in *
do
	j=`echo "$i" | tr [:upper:] [:lower:]`
	mv -vi "$i" "$j"
done
