#!/bin/bash -l

#To insert sample name as label

for i in $(cat test_list.txt)
do
    awk -v i_name="$i" '{print $0=i_name"\t"$0}' "$i"_all_bin_stats.tsv | awk -F'\t' '$2!=""' | awk -F'\t' -v OFS="\t" '{print $1, $33, $36}'| tail -n+2 | sed '1 i\sample\tcoverage\tclassification' 
done | awk '!unique[$0]++' > all_sample_coverage.tsv


#To separate out coverage columns
#do
 #   cat "$i"_all_bin_stats.tsv | awk -F'\t' '{printf $4 "," $6 "\n" }' < "$i"coverage.tsv
#done
