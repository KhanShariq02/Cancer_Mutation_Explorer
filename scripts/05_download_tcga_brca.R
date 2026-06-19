library(TCGAbiolinks)
packageVersion("TCGAbiolinks")

query <- GDCquery(
  project = "TCGA-BRCA",
  data.category = "Simple Nucleotide Variation",
  data.type = "Masked Somatic Mutation",
  workflow.type = "MuTect2 Variant Aggregation and Masking"
)

query
capabilities("libcurl")
packageVersion("TCGAbiolinks")
