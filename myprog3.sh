
# takes all user writable files in an array
all_files=($(find . -type f -perm -u=w -not -name "myprog3.sh" -not -path "./writable/*"))

# finds this arrays size
array_size=${#all_files[@]}

# stores how many file is wrote,it starts from zero
wrote_count=0

# checks the array is empty or not
if [ $array_size -eq 0 ];
then
	echo "WARNING : No writable files found under this directory and it's subdirectories"
else
	# makes a directory which named as writable
	mkdir -p writable
	# for each writable files in all_files array ,moves that file to writable directory 
	for current_file in "${all_files[@]}"; do
		mv $current_file writable
		# finds how many files moved to writable directory
		wrote_count=$(expr $wrote_count + 1)
	done
	echo "$wrote_count files moved to writable directory"
fi
