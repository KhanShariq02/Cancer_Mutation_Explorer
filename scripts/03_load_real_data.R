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
gene_summary %>% head(10)
