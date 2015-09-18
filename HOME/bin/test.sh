#!/bin/bash

#number of apache connections
tmp=`date +%d/%b/%Y:%H:%M`
last=`echo $tmp | sed 's/.*\(.\)$/\1/'`
base=`echo $tmp | sed 's/\(.*\).$/\1/'`
second=`echo $base | sed 's/.*\(.\)$/\1/'`
base=`echo $base | sed 's/\(.*\).$/\1/'`
if [ $last == '0' ]; then
str=[5-9]
second=$[$second - 1]
fi
if [ $last == '5' ]; then
str=[0-4]
fi
search=`echo $base$second$str`
grep -E `echo $search` /var/log/httpd/access_log | sed -n '/\/music/p' | sed -n '/^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/ p' | sed 's/^\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/' | uniq | wc -l
