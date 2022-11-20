#!/bin/bash -l

# To move sample files in respective folders

for i in $(cat ibs_list.txt)
do
    mv -v "$i"_all_bin_stats.tsv ibs/
done
