for((i = 2; i<$1 ; i++))
do
	### Prime number finder
	control=0
	
	for((j=2 ; j<$i ; j++))
	do
		if [ $(($i % $j)) -eq 0 ]
		then
			control=1
			j=$i
		fi		
	done
	####
	
	if [ $control -eq 0 ]
	then
	
		number=$i
		varToFindResult=$i
		hexValue="" 
		
		### Hexadecimal converter
		
		while [ $varToFindResult -gt 0 ]
		do
		
			digit=$(( varToFindResult % 16 ))
			varToFindResult=$(( varToFindResult / 16 )) 
			
			if [ $digit -eq 0 ]
			then
				hexValue="0$hexValue" 
			elif [ $digit -eq 1 ]
			then
				hexValue="1$hexValue"
			elif [ $digit -eq 1 ]
			then
				hexValue="1$hexValue"
			elif [ $digit -eq 2 ]
			then
				hexValue="2$hexValue"
			elif [ $digit -eq 3 ]
			then
				hexValue="3$hexValue"
			elif [ $digit -eq 4 ]
			then
				hexValue="4$hexValue"
			elif [ $digit -eq 5 ]
			then
				hexValue="5$hexValue"
			elif [ $digit -eq 6 ]
			then
				hexValue="6$hexValue"
			elif [ $digit -eq 7 ]
			then
				hexValue="7$hexValue"
			elif [ $digit -eq 8 ]
			then
				hexValue="8$hexValue"
			elif [ $digit -eq 9 ]
			then
				hexValue="9$hexValue"
			elif [ $digit -eq 10 ]
			then
				hexValue="A$hexValue"
			elif [ $digit -eq 11 ]
			then
				hexValue="B$hexValue"
			elif [ $digit -eq 12 ]
			then
				hexValue="C$hexValue"
			elif [ $digit -eq 13 ]
			then
				hexValue="D$hexValue"
			elif [ $digit -eq 14 ]
			then
				hexValue="E$hexValue"
			elif [ $digit -eq 15 ]
			then
				hexValue="F$hexValue"
			fi
		done
		###
		
		###Result
		echo "Hexadecimal of $number is $hexValue"
		###
	fi	
done
