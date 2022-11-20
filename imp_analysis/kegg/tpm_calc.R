#!/usr/bin/env Rscript
args= commandArgs(trailingOnly = TRUE)
in_file = args[1]
out_file = args[2]

library(tidyverse)

kegg <- read.table(file = in_file, sep = "\t", header = T, row.names = 1, check.names = F)

kegg_mod <- kegg %>% mutate(RbyL = reads/length) %>% 
		mutate(sum_RbyL = sum(RbyL)) %>% 
		mutate(TPM = RbyL/sum_RbyL *1000000) %>%
                mutate("sample" = tools::file_path_sans_ext(in_file)) %>%
                mutate(sample = str_replace(sample, "_kegg_counts", "")) %>%
                relocate(sample) %>%
		select(sample, reads, length, TPM) %>% 
		rownames_to_column(., var= "kegg")

#message("writing tpm calculation for:" outfile)
write.csv(kegg_mod, out_file, row.names = F)
