#!/bin/bash


# add and return values in an array

sum()
{
	local sum=0
	local orgarray=($(echo "$@"))
	local newarray=($(echo "$@"))
	for ((i = 0; i < $#; i++))
	do
		newarray[$i]=$[ ${orgarray[$i]} * 2 ]
	done
	echo ${newarray[*]}
}

read -p "Input an array: " array
echo "Original array: ${array[*]}"

result=$(sum ${array[*]})
echo "Double of (${array[*]}) is (${result[*]})."

