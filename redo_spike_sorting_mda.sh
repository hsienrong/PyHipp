#!/bin/bash

# Find all channels
find . -name "channel*" | grep -v -e eye -e session01 | sort | cut -d "/" -f 3 > chs_mountains.txt
find . -name "firings.mda" | grep -v -e eye | sort | cut -d "/" -f 3 > mda_list.txt

echo "--- Channels Incomplete: ---"
comm -23 chs_mountains.txt mda_list.txt
echo "------"
cwd=$(pwd)
echo "CWD: $cwd"
echo "------"

for i in $(comm -23 chs_mountains.txt mda_list.txt)
do
	echo "CD: $(find . -name $i | grep -v -e eye -e mountains)"
	cd $(find . -name $i | grep -v -e eye -e mountains)
	sbatch /data/src/PyHipp/rplhighpass-sort-slurm.sh
	cd $cwd
done

