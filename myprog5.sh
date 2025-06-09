
numberofargs=$#

# checks if the number of arguments is one
if [ $numberofargs -eq 1 ];
	then
		# finds the files with the given wildcard just in the current directory without its sub 			directories
		all_files=($(find . -maxdepth 1 -type f -name "$1"))
		
		# holds the total number of files found
		array_size=${#all_files[@]}
		
		# checks if there is no match
		if [ $array_size -eq 0 ];
			then
			echo "No files found according to the wildcard!"
		fi
		
		# loop that takes the found files each by each and asks the user for deletion
		for file in "${all_files[@]}";do
			while true; do
			echo -n "Do you want to delete $file ? (y/n) : " 
			read yesno
			if [ "$yesno" = "y" ];
				then 
				rm -rf $file
					echo "File deleted"
					break
			elif [ "$yesno" = "n" ];
				then
					echo "File is not deleted"
					break
			else
				echo "Wrong input!"
			fi
			done
		done
		# checks if the number of arguments is two
elif [ $numberofargs -eq 2 ];
	then
		# finds the files according to the wildcard and directory given
		all_files=($(find "$2" -type f -name "$1"))
		
		array_size=${#all_files[@]}
		
		# checks if there is no match
		if [ $array_size -eq 0 ];
			then
			echo "No files found according to the wildcard!"
		fi
		
		# loop that takes the found files each by each and asks the user for deletion
		for file in "${all_files[@]}";do
			while true; do
			echo -n "Do you want to delete $file ? (y/n) : " 
			read yesno
			if [ "$yesno" = "y" ];
				then 
				rm -rf $file
					echo "File deleted"
					break
			elif [ "$yesno" = "n" ];
				then
					echo "File is not deleted"
					break
			else
				echo "Wrong input!"
			fi
			done
		done
		# other conditions for handling the errors caused by user input
elif [ $numberofargs -eq 0 ];
	then
	echo "You didn't give any arguments!"
else
	echo "Wrong argument count! You have given more than two arguments"
fi
