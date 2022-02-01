#!/bin/bash


# a factorial function
number=5
result=1
if [ $number -lt 0 ]
then
	echo "Number is less than 0."
elif [  $number -eq 0 ]
then	
	echo "Factorial if $number is 1."
else
	while test $number -ne 1 
	do
		result=$[$result * $number]
		((number--))
	done
	echo "Factorial of $number is $result."
fi	
