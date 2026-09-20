#!/bin/bash

# Author : Md Rijwan Alam
# Date: 20-sep -2026

read -p "Enter any service name : " service

read -p "Do you want to check the status? (y/n)" ans

if [[ $ans == 'y' || $ans == 'Y' || $ans == 'Yes' || $ans == 'yes' ]];then
	:
elif [[ $ans == 'n' || $ans == 'N' || $ans == 'No' || $ans == 'no' ]];then
	echo "Skipped"
	exit 1
else
	echo "Enter valid answer. Quitting."
	exit 1
fi

systemctl status $service  | awk '/Active/ {print $2}'

