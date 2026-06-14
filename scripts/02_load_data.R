library(tidyverse)

mutations <- read_csv("/Users/khan/Desktop/Cancer_mutation_explorer/data/practice_mutations.csv")
print(mutations)

mutations %>% count(Gene, sort=TRUE)
mutations %>% count(MutationType, sort=TRUE)

install.packages("ggplot2")

mutations %>% count(Gene) %>% ggplot(aes(x=Gene, y=n)) +
geom_col()


