#!/bin/bash
#
# Test signal trapping
#
# trap ctrl+C
trap ' echo " Ctrl+C has been trapped." ' SIGINT
# trap end of script
trap ' echo " Test is over." '	EXIT
#
count=1
#
while [ $count -ne 5 ]
do
	echo "count: $count"
	sleep 1
	((count++))
done
#
# remove the trap
trap -- SIGINT
while [ $count -ne 10 ]
do
	echo "count: $count"
	sleep 1
	((count++))
done
#
