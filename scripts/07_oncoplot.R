library(maftools)
library(ggplot2)
packageVersion("maftools")

brca_maf <- read.maf(
    maf = "/Users/khan/Desktop/Cancer_mutation_explorer/data/brca_tcga_pan_can_atlas_2018/data_mutations.txt"
)

# Open PNG device before creating the oncoplot
png("/Users/khan/Desktop/Cancer_mutation_explorer/figures/oncoplot_top20.png",
width = 2000,
height = 1800,
res = 300)

#Create Oncoplot
oncoplot( 
    maf = brca_maf ,
    top = 20,
    draw_titv = TRUE   #a secondary plot panel (Transitions/Transversions)
    )

# Close device and save file
dev.off()

