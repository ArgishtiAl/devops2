#!/bin/bash 

echo "Shell Scripting is Fun!"
#------------------------------

VAR="Shell Scripting is Fun!"
echo ${VAR}

#--------------------------------------
VAR1=$(hostname)
echo "This script is running on ${VAR1}"

#------------------------------------------
if [ -e /etc/shadow ]; then
    echo "Shadow passwords are enabled."

    if [ -w /etc/shadow ]; then
        echo "You have permissions to edit /etc/shadow."
    else
        echo "You do NOT have permissions to edit /etc/shadow."
    fi
else
    echo "/etc/shadow does not exist."
fi



#-------------------------------------------------

VAR3="man bear pig dog cat sheep"


for i in ${VAR3};
#"man", "bear", "pig", "dog", "cat", "sheep"
do 
	echo $i
done

#-------------------------------------------------------


read -p "Enter the name " name 

if [ -e "$name" ]; then
    if [ -f "$name" ]; then
        echo "$name" "a regular file."
    elif [ -d "$name" ]; then
        echo "$name is a directory."
    else
        echo "$name another type."
    fi
    ls -l "$name"
else
    echo "$name does not exist."
fi

#-------------------------------------------------------

if [ $# -eq 1 ]; then 
	file ="$1"

	if [-d "$file"]; then 
		echo "$file is directory"
	elif [-f "$file"]; then 
		echo  "$file is file "
	else 
		echo "$file does not exist "
	fi
else 
	echo "Please provide a file or directory "
fi







