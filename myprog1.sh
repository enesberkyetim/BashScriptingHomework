echo "$1 is string"

# first argument named as argument1
argument1=$1
# how many characters are there in string argument
sizeofstring=${#1}

echo "$2 is number"
# second argument named as argument2
argument2=$2
# length of second given argument
sizeofnumber=${#2}

#  does first and second arguments have same length ?
if [ $sizeofstring -eq $sizeofnumber ]
then 
  for (( i=0; i<$sizeofstring; i++))
  do 
  	charofstring="${argument1:$i:1}" # takes ith character of string argument
     	charofnumber="${argument2:$i:1}" # takes ith character of number argument
     	asciicharstring=$(printf "%d" "'$charofstring") # makes ith strings char to ascii value
     	integernumber=$(expr $(printf "%d" "'$charofnumber") - 48) #  makes ith number char to integer value
     	
     	# checks if the character not exceeds the last letter when advanced by int number
     	if [ $(expr $asciicharstring + $integernumber) -le 122 ] 
     	
     		
     		then
     		
     		# if not exceeds,finds the new character
     		nextcharacter=$(printf "\\$(printf '%03o' $(expr $(expr $asciicharstring + $integernumber) % 122))")
     		echo -n "$nextcharacter"
     	else
     		# if exceeds,finds the new character
    		nextcharacter=$(printf "\\$(printf '%03o' $(expr $(expr $(expr $asciicharstring + $integernumber) % 122) + 96))")
    		echo -n "$nextcharacter"
    	fi
  done
	echo
	
	
	

# is argument2 only one number?
elif [ $sizeofnumber -eq 1 ]
then 
  #  takes argument2 as a character
  charofnumber="${argument2:0:1}"
  //makes this character to integer number
  integernumber=$(expr $(printf "%d" "'$charofnumber") - 48)
  
  # for each character of string argument
  for (( i=0; i<$sizeofstring; i++))
  do	
  	# takes ith character of string argument
  	charofstring="${argument1:$i:1}"
  	# makes this character to ascii value
  	asciicharstring=$(printf "%d" "'$charofstring")
  	
  	#  checks if the character not exceeds the last letter when advanced by int number
  	if [ $(expr $asciicharstring + $integernumber) -le 122 ]
     		then
     		nextcharacter=$(printf "\\$(printf '%03o' $(expr $(expr $asciicharstring + $integernumber) % 122))")
     		echo -n "$nextcharacter"
     	else
     	# checks if the character exceeds the last letter when advanced by int number
    		nextcharacter=$(printf "\\$(printf '%03o' $(expr $(expr $(expr $asciicharstring + $integernumber) % 122) + 96))")
    		echo -n "$nextcharacter"
    	fi
  done
	echo
	
else
	echo "Given number's length is not equal either string's length or 1" 
fi
