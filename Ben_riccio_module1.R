library(ggplot2)
library(tidyverse)

setwd("/Users/benriccio/Documents/R code/")

#open file
dat <- read.csv("scales.csv")

#report class 
sapply(dat,class)

#dimensions
dim(dat)

#scales punctured by species 
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
species.n <- dat %>%
  group_by(species) %>%
  summarise(n=n())
species.n

#number of specimen sampled per species 
specimen.n <- dat %>%
  count(species, specimen) %>%
  count(species,name = "n.specimens")
  specimen.n
  
#pdf of plots 
pdf("Riccio_Ben_species_quadrants.pdf")
for(i in species){
    p <- dat %>%
      filter(species==i)%>%
      ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
    print(p)
}
dev.off()
list.files(pattern=".pdf")
  
