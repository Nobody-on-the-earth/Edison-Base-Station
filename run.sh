#!/bin/bash

lat='25.021780'
long='121.535259'

while true
do
	while read line
	do
		#echo $line
		[ -n "`grep "$line" dev_list`" ] && echo "`date +\"%s\"`, $lat, $long, $line" >> log
	done < <(/home/root/bluez-5.44/tools/btmgmt find | grep -B1 hci0 | grep -o 'dev_found:\ \([0-9A-F]\{2\}:\?\)\{6\}' | sed 's/dev_found:\ //g' | sort -u)
	sleep 10

	#TODO: auto update dev_list when it is availiable
done

