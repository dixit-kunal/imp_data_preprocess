#!/usr/bin/env Rscript
args= commandArgs(trailingOnly = TRUE)
in_file = args[1]
out_file = args[2]

library(tidyverse)

pfam <- read.table(file = in_file, sep = "\t", header = T, row.names = 1, check.names = F)

pfam_mod <- pfam %>% mutate(RbyL = reads/length) %>% 
		mutate(sum_RbyL = sum(RbyL)) %>% 
		mutate(TPM = RbyL/sum_RbyL *1000000) %>%
                mutate("sample" = tools::file_path_sans_ext(in_file)) %>%
                mutate(sample = str_replace(sample, "_pfam_counts", "")) %>%
                relocate(sample) %>%
		select(sample, reads, length, TPM) %>% 
		rownames_to_column(., var= "pfam")

#message("writing tpm calculation for:" outfile)
write.csv(pfam_mod, out_file, row.names = F)
