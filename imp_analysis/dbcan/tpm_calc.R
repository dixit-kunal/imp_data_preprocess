#!/usr/bin/env Rscript
args= commandArgs(trailingOnly = TRUE)
in_file = args[1]
out_file = args[2]

library(tidyverse)

caz <- read.table(file = in_file, sep = "\t", header = T, row.names = 1, check.names = F)

caz_mod <- caz %>% mutate(RbyL = reads/length) %>% 
		mutate(sum_RbyL = sum(RbyL)) %>% 
		mutate(TPM = RbyL/sum_RbyL *1000000) %>%
                mutate("sample" = tools::file_path_sans_ext(in_file)) %>%
                mutate(sample = str_replace(sample, "_dbCAN_counts", "")) %>%
                relocate(sample) %>%
		select(sample, reads, length, TPM) %>% 
		rownames_to_column(., var= "caz")

#message("writing tpm calculation for:" outfile)
write.csv(caz_mod, out_file, row.names = F)
