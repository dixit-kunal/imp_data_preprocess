#!/bin/bash -l

# To copy sample files in respective folders

for i in $(cat ibs_list.txt)
do
    cp /scratch/users/kdixit/imp/imp_stool_output/"$i"/run1/Analysis/taxonomy/kraken/mg.kraken.report /scratch/users/kdixit/imp/imp_annotation/kraken/ibs/"$i"_kraken_report.tsv
done
