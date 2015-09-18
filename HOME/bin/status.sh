#!/bin/bash

#ping to 8.8.8.8
ping -c10 8.8.8.8 | tail -n1 | cut -d'/' -f5 >> /srv/http/status/ping 
cat /srv/http/status/ping | tail -n288 > /tmp/s
mv /tmp/s /srv/http/status/ping

#core temp
sensors | grep "Core 1" | sed 's/[^\ .0-9]//g; s/[\ ]\+/ /g;' | cut -d' ' -f3 | sed 's/^\([0-9][0-9]\).*/\1/' >> /srv/http/status/temp
cat /srv/http/status/temp | tail -n288 > /tmp/s
mv /tmp/s /srv/http/status/temp

#load average
w | sed -n 's/^.*average:\ //; 1p' | cut -d' ' -f2 | sed 's/.$//' >> /srv/http/status/load 
cat /srv/http/status/load | tail -n288 > /tmp/s
mv /tmp/s /srv/http/status/load

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
grep -E `echo $search` /var/log/httpd/access_log | sed -n '/status\/status\.php/!p' | sed -n '/^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/ p' | sed 's/^\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/' | uniq | wc -l >> /srv/http/status/connect
cat /srv/http/status/connect | tail -n288 > /tmp/s
mv /tmp/s /srv/http/status/connect

#number of music connections
grep -E `echo $search` /var/log/httpd/access_log | sed -n '/\/music\//p' | sed -n '/^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/ p' | sed 's/^\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/' | uniq | wc -l >> /srv/http/status/music
cat /srv/http/status/music | tail -n288 > /tmp/s
mv /tmp/s /srv/http/status/music
