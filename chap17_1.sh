#!/bin/bash

# define a function
double()
{
	echo $[2 * $1]
}
#
read -p "Input a number:" number
#
# passing parameters to a function
result=`double $number`
#
echo Double of $number is $result.

