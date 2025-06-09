# Create variables for each documents of the story
girisFile="giris.txt"
gelismeFile="gelisme.txt"
sonucFile="sonuc.txt" 

# declare the lists for each documents
declare -a girisList
declare -a gelismeList
declare -a sonucList

# It is a variable to find out the number of lines for the file called giris.txt
lineCounterGiris=0

## Giris.txt's lines
while IFS= read -r line;
do
	if [[ -n "$line" ]]
	then
		girisList[$lineCounterGiris]="$line"
		lineCounterGiris=$(expr $lineCounterGiris + 1)
	fi
done < "$girisFile"
##

# It is a variable to find out the number of lines for the file called gelisme.txt
lineCounterGelisme=0

## Gelisme.txt's lines
while IFS= read -r line;
do
	if [[ -n "$line" ]]
	then
		gelismeList[$lineCounterGelisme]="$line"
		lineCounterGelisme=$(expr $lineCounterGelisme + 1)
	fi
done < "$gelismeFile"
##

# It is a variable to find out the number of lines for the file called sonuc.txt
lineCounterSonuc=0

## Sonuc.txt's lines
while IFS= read -r line;
do
	if [[ -n "$line" ]]
	then
		sonucList[$lineCounterSonuc]="$line"
		lineCounterSonuc=$(expr $lineCounterSonuc + 1)
	fi
done < "$sonucFile"
##

## Random line indexes are created here to generate random story1.txt document
randomNumberForGiris=$((RANDOM % lineCounterGiris))
randomNumberForGelisme=$((RANDOM % lineCounterGelisme))
randomNumberForSonuc=$((RANDOM % lineCounterSonuc))

#echo "$randomNumberForGiris" "$randomNumberForGelisme" "$randomNumberForSonuc"

if [ -f "$1" ]
then
	echo -n "$1 exists. Do you want it to be modified? (y/n): "
	read yesOrNo
	
	if [ "$yesOrNo" == "y" ]
	then
		echo "A random story is created and stored in story1.txt."
		# delete the story beforehand and create new one.
		
		# create a story
		story1Content=("${girisList[$randomNumberForGiris]}" "${gelismeList[randomNumberForGelisme]}" "${sonucList[randomNumberForSonuc]}")
		
		# Delete old story of the specified document
		> "$1"
		
		## Print the randomly selected lines to the specified file
		for line in "${story1Content[@]}";
		do
		# Print a line
		echo "$line" >> "$1"
		# Print a blank line
		echo "" >> "$1"
		done
		
	elif [ "$yesOrNo" == "n" ]
	then
		# There is a random thing done here since an if block cannot be empty.
	 	x=12
	fi
	
else 
	# create the file with the name which is indicated in the first command line argument
	touch story1.txt
	
	# create a story.
	story1Content=("${girisList[$randomNumberForGiris]}" "${gelismeList[randomNumberForGelisme]}" "${sonucList[randomNumberForSonuc]}")
	
	## Print the randomly selected lines to the specified file	
	for line in "${story1Content[@]}";
	do	
		# Print a line
		echo "$line" >> "$1"
		# Print a blank line
		echo "" >> "$1"
	done
fi
