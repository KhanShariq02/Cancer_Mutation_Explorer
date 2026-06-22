library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)

getwd()
setwd("/Users/khan/Desktop/Cancer_mutation_explorer")

mutations <- read_tsv("data/brca_tcga_pan_can_atlas_2018/data_mutations.txt",
                        comment = "#") # using comment = "#" to ignore any line (or part of a line) that starts with a hashtag symbol (#)
dim(mutations)

colnames(mutations)

head(mutations)

mutations %>% count(Hugo_Symbol, sort = TRUE)

# 1) Most frequently mutated genes in TCGA breast cancer patients.
gene_counts <- mutations %>% count(Hugo_Symbol, sort = TRUE)
head(gene_counts,10)

top20 <- gene_counts %>% slice_head(n=20)

#Plot creation
ggplot(top20, aes(x=reorder(Hugo_Symbol,n),
                    y = n)) + geom_col() + coord_flip() + 
                    labs(title = "Top 20 Mutated Genes in TCGA Breast Cancer",
                            x= "Gene",
                            y= "Mutation Counts")
#Saving the plot
ggsave("/Users/khan/Desktop/Cancer_mutation_explorer/figures/plot.png",
        width = 8, height = 6)

# 2) Mutation Type Distribution
#First find the mutation type variable by searching the column name "Classification"
grep("Classification", colnames(mutations), value=TRUE)

mutation_types <- mutations %>% count(Variant_Classification, sort = TRUE)
mutation_types
head(mutation_types,10)
#plot
top_mutation_types <- mutation_types %>% slice_head(n=10)

ggplot(top_mutation_types , 
        aes(x=reorder(Variant_Classification,n),
        y=n)) + geom_col() + coord_flip()
        labs(title = "Mutation Type Distribution in TCGA Breast Cancer",
                                x = "Mutation Type",
                                y = "Count")
ggsave("figures/mutation_type_distribution.png",width = 8 , height = 6) 

# 3) Mutation Burden per Patient
#First search patient/sample column
grep("Sample", colnames(mutations), value=TRUE)

sample_counts <- mutations %>% count(Tumor_Sample_Barcode,
                                     sort = TRUE)
head(sample_counts,10)

top_samples <- sample_counts %>% slice_head(n=20)

#plot
ggplot(top_samples, 
        aes(x=reorder(Tumor_Sample_Barcode,n), y=n)) + 
        geom_col() + coord_flip() +
        labs(title = "Top 20 Samples by Mutation Burden",
                x= "Sample",
                y= "Number of Mutations")
ggsave("figures/top20_mutation_burden.png", width = 8, height = 6)

