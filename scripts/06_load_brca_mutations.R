library(readr)
library(dplyr)

getwd()
setwd("/Users/khan/Desktop/Cancer_mutation_explorer")

mutations <- read_tsv("data/brca_tcga_pan_can_atlas_2018/data_mutations.txt",
                        comment = "#") # using comment = "#" to ignore any line (or part of a line) that starts with a hashtag symbol (#)
dim(mutations)

colnames(mutations)

head(mutations)

mutations %>% count(Hugo_Symbol, sort = TRUE)

#Most frequently mutated genes in TCGA breast cancer patients.
gene_counts <- mutations %>% count(Hugo_Symbol, sort = TRUE)
head(gene_counts,20)
head(gene_counts,10)
