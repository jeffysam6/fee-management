#!/bin/bash


declare -A cost students
cost=([comp]=1000 [elec]=2000 [it]=3000)

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
	echo "Enter the first name"
	read name

	echo "Enter the branch"
	read branch

	echo "cost of branch is ${cost[$branch]}" 
	
	students[$name]=${cost[$branch]}
	
;;

2) 
    echo "Enter student's first name"
    read first
    
    echo "Amount due is ${students[$first]}"
    
    echo "Enter the amount you want to pay"
    read amount
    
    echo "Entered amount is being deducted from the total amount"
    students[$first]=$(( students[$first] - amount ))
    
    echo "Students current amount is ${students[$first]} "

;;


3) exit ;;

esac

done
