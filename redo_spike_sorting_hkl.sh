#!/bin/bash

# Find all channels
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs_hkl.txt
find . -name "rplhighpass*hkl" | grep -v -e eye | sort | cut -d "/" -f 1-4 > hps.txt

echo "--- Channels Incomplete: ---"
comm -23 chs_hkl.txt hps.txt
echo "------"
cwd=$(pwd)
echo "CWD: $cwd"
echo "------"

for i in $(comm -23 chs_hkl.txt hps.txt)
do
	cd $i
	echo "NOW IN: $i"
	sbatch /data/src/PyHipp/rplhighpass-sort-slurm.sh
	cd $cwd
done

