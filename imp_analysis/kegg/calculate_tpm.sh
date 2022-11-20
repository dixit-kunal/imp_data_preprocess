#!/bin/bash -l

# To copy sample files in respective folders
conda activate renv

for i in $(cat ibs_list.txt)
do
    Rscript tpm_calc.R "$i"_kegg_counts.tsv "$i"_tpm.tsv
done

