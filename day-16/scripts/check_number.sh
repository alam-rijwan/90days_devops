#!/bin/bash

##################################
# Author: Md Rijwan Alam
# Date: 20-sep-2026
##################################

<<usage
- Number checker 
-positive, negative or zero
usage

read -p "Please enter number you choice: " num


if [ $num -eq $num ] &>/dev/null; then
   :  
   else
     echo "Enter value is Invalid XX"
   exit 1
fi

if [ $num -gt 0 ]; then
	echo "Number is positve (+) "

elif [ $num -lt 0 ]; then
	echo "Number is negative(-)"

else 
	echo "Number is Zero (0)"

fi
