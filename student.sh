
#!/bin/bash

declare -A cost students
cost=([COMP]=1000 [ELEC]=2000 [IT]=3000 [EXTC]=5000)

echo "Name				Amount due 					    Date" > common

out_file()
{

	
	echo "$name  			  $remaining					$NOW" >> $name 

	echo "$name  			  $remaining					$NOW" >> common 

}

show_menus() {
	echo "                                                                                            "
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\n"
	echo "1. NEW ADMISSION"
	echo "2. PAY DUE"
	echo "3.Print Transaction History"
	echo "4.Exit"
}

read_options(){
	local choice
	read -p "Enter choice [ 1 - 4]:" choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three;;
		4) exit 0;;
		*) echo  "Error..." && sleep 2
	esac
}

one(){
	echo -e "\n"
	echo "Enter the full name"
	read name

	name=${name%% *}
	echo -e "\n"
	echo "Choose the branch"
	
	echo "1.Computer Science"
	echo "2.EXTC"
	echo "3.IT"
	echo "4.Electrical"
	read branch
	case $branch in 
		1) students[$name]=${cost[COMP]}
			echo "Fee of the chosen branch is ${cost[COMP]}";;
		2)  students[$name]=${cost[EXTC]}
			echo "Fee of the chosen branch is ${cost[EXTC]}";;
		3) students[$name]=${cost[IT]}
			echo "Fee of the chosen branch is ${cost[IT]}";;
		4) students[$name]=${cost[ELEC]}
			echo "Fee of the chosen branch is ${cost[ELEC]}";;

	esac
	
	

	NOW=$(date +"%m-%d-%Y %H:%M")		

	remaining=${students[$name]}

	# out_file $name $remaining $NOW

	echo "Name				Amount due 					    Date" > $name 

	echo "$name  			  $remaining					$NOW" >> $name

	echo "$name  			  $remaining					$NOW" >> common



}

two(){
	echo -e "\n"
	echo "Enter Student's name"
    read name

    name=${name%% *}
    
    echo "Amount due is ${students[$name]}"
    echo -e "\n"
    echo "Enter the amount received"
    read amount
    
    echo "Entered amount is being deducted from the total amount"
    students[$name]=$(( students[$name] - amount ))

    NOW=$(date +"%m-%d-%Y %H:%M")

    remaining=${students[$name]}

    out_file $name $remaining $NOW

    echo -e "\n"
    echo "$name's remaining amount is  = ${students[$name]} "

   	
}

three(){


	echo "Choose the type of output"
	echo "1. Transaction History of a Student"
	echo "2. Common Transaction History"
	read trans
	case $trans in 
		1) echo "Enter the name of the Student"
		   read first
		   first=${first%% *}
		   cat $first
		   ;;

		2) cat common
		   ;;

	esac
		

	


}



while true
do
 	clear
	show_menus
	read_options

	echo -e "\n"
	echo -e "Enter return to continue \c"
	read input

done