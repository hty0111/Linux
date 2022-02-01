#!/bin/bash

# recursion
#
factorial()
{
	if [ $# -eq 1 ] && [ $1 -ge 0 ]
	then
		if [ $1 -eq 0 ] || [ $1 -eq 1 ]
		then	
			echo 1
		else
			echo $[ $1 * $(factorial $[ $1 - 1]) ]
		fi
	else
		echo -1
	fi
}
#
#
read -p "Input an positive value: " value
#
result=$(factorial $value)
#
if [ $result -lt 0 ]
then
	echo "Input should be greater than 0."
else
	echo "The factorial of $value is $result."
fi
#
