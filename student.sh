#!/bin/bash


declare -A cost students
cost=([COMP]=1000 [ELEC]=2000 [IT]=3000 [EXTC]=5000)

function out_file 
{

	echo "Name-$name Amount due -$remaining Date-$NOW" >> $name
}



c=999

while [ $c -gt 0 ]; do

echo "******MENU*******"

echo "1. NEW ADMISSION"
echo "2. PAY DUE"
echo "3.Exit"
echo "SELECT AN OPTION"

read choice

case $choice in

1) 
	echo "Enter the full name"
	read name

	name=${name%% *}

	echo "Enter the branch of choice"
	read branch

	echo "Fee of the chosen branch is ${cost[$branch]}" 
	
	students[$name]=${cost[$branch]}

	NOW=$(date +"%m-%d-%Y %H:%M")		

	remaining=${cost[$branch]}

	out_file $name remaining $NOW
	
;;

2) 
    echo "Enter Student's name"
    read first

    first=${first%% *}
    
    echo "Amount due is ${students[$first]}"
    
    echo "Enter the amount received"
    read amount
    
    echo "Entered amount is being deducted from the total amount"
    students[$first]=$(( students[$first] - amount ))

    NOW=$(date +"%m-%d-%Y %H:%M")

    remaining=${students[$first]}

    out_file $first $remaining $NOW

    
    echo "$first 's remaining amount is ${students[$first]} "

;;


3) exit ;;

esac

done
