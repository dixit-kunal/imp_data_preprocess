#!/bin/bash -l

# To copy sample files in respective folders

for i in $(cat ibs_list.txt)
do
    tail -n+3 /scratch/users/kdixit/imp/imp_stool_output/"$i"/run1/Analysis/annotation/mg.dbCAN.counts.tsv | awk -F'\t' -v OFS="\t" '{print $1, $6, $7}' | sed '1 i\caz_id\tlength\treads' > /scratch/users/kdixit/imp/imp_annotation/dbCAN/ibs/"$i"_dbCAN_counts.tsv
done
