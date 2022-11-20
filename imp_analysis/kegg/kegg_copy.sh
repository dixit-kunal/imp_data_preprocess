#!/bin/bash -l

# To copy sample files in respective folders

for i in $(cat ncgs_pg_list.txt)
do
    tail -n+3 imp_stool_output/"$i"/run1/Analysis/annotation/mg.KEGG.counts.tsv | awk -F'\t' -v OFS="\t" '{print $1, $6, $7}' | sed '1 i\kegg_id\tlength\treads' > imp_annotation/kegg/ncgs_pg/"$i"_kegg_counts.tsv
done
