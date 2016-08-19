#!/usr/bin/env bash
while true; do
	DATE=$(date "+%A %B %d, %Y")
	TIME=$(date "+%I:%M %p")
	UP=$(uptime -p)
	DESKTOP=$(bspc query -D -d)
	LOAD=$(cat /proc/loadavg | awk '{print $1 " " $2 " " $3}')
	echo "%{l}" $DESKTOP "|" $LOAD "|" $UP "%{c}" $TIME "%{r}" $DATE
	sleep 0.2
done
