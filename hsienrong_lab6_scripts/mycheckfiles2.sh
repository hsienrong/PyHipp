#!/bin/bash
# TAN HSIEN RONG (A0255341L) - EE3801 LAB 6

# Get number of hkl and mda files (as per previous labs)
echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "#==========================================================="
echo "Start Times"

# Use glob to get all files ending with .out (realistically the output files of both jobs)
for OUT_FILES in "./"*.out	
do
	echo -e "\n==> $(basename $OUT_FILES) <==" 	# Print file name
	head -n 1 $OUT_FILES				# Get start time using head
done

echo "------------" # Included this extra line for clarity!

echo -e "\n\nEnd Times"

# Use glob to get all files ending with .out (realistically the output files of both jobs)
for OUT_FILES in "./"*.out
do
	echo -e "\n==> $(basename $OUT_FILES) <=="	# Print file name
	tail -n 5 $OUT_FILES 				# Get end time using head
done

echo -e "\n#==========================================================="
