# Load required libraries
library(ggplot2)
library(tidyverse)
library(dplyr)

# Load the scales dataset
dat <- read.csv("scales.csv")

#species loading
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
species

# Report the class of each column
column_classes <- sapply(dat, class)
print(column_classes)

# Report the dimensions of the dataset
dataset_dimensions <- dim(dat)
print(dataset_dimensions)

# Summary of the number of scales punctured for each species
SumPunc <- dat %>%
  mutate(species = as.factor(species)) %>%
  count(species) %>%
  rename(Species = species, Punctures = n)
  SumPunc

# Summary of the number of specimens sampled for each species
  species.n<- dat %>%
    group_by(species) %>%
    summarise(n = n())
  species.n

# Create a PDF file with 6 figures (one for each species)
for(i in 1:10) print(i)
pdf("Jonah_Kotzen_species_quandrant.pdf")
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}

dev.off()
list.files(pattern = ".pdf")

