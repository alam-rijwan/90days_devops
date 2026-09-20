#!/bin/bash

##################################
# Author: Md Rijwan Alam
# Date: 20-sep-2026
#################################


<<usage
-Files Checking
usage



read -p "Please enter any file name : " fname

if [ -f $fname ];then
	echo "The file exists."
else
	echo "The file doesn't exist".
fi
