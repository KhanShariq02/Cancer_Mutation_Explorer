library("maftools")
library("tidyverse")

#load example data
laml <- system.file("extdata", "tcga_laml.maf.gz",
    package = "maftools")
laml
maf <- read.maf(maf=laml)
maf

getSampleSummary(maf) %>% head()

getGeneSummary(maf) %>% head()

gene_summary <- getGeneSummary(maf)
gene_summary %>% count(Hugo_Symbol , sort = TRUE)


plotmafSummary(maf)

oncoplot(maf=maf,
    top = 10)

gene_summary <- getGeneSummary(maf)
gene_summary

#top 5 most frequently mutated genes
gene_summary %>% arrange(desc(total)) %>%
    select(Hugo_Symbol,total) %>% head(5)

#genes mutated in the largest number of samples
gene_summary %>% select(Hugo_Symbol,MutatedSamples) %>%
arrange(desc(MutatedSamples)) %>% head() %>% 

#top10 genes
gene_summary <- getGeneSummary(maf)
top10 <- gene_summary[1:10 , ]
top10

#Saving results
getwd()
setwd("/Users/khan/Desktop/Cancer_mutation_explorer")
write_csv(top10 , file = "results/top10_genes.csv")

#plot
library(ggplot2)
packageVersion("ggplot2")
top10 %>% ggplot(aes(x=reorder(Hugo_Symbol,MutatedSamples),
    y= MutatedSamples)) + geom_col() + coord_flip()

#mutation burden on samples with highest burden and lowest burden.
sample_summary <- getSampleSummary(maf)
sample_summary %>% head()
sample_summary %>% 
    filter(total == max(total) | total==min(total))

#plotting mutation burden
sample_summary %>% ggplot(aes(x=reorder(Tumor_Sample_Barcode,total),
    y=total)) + geom_col() + coord_flip()







