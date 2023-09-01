library(ggplot2)
library(tidyverse)

setwd("/Users/seobinyoo/Downloads")

data <- read.csv("scales.csv")

dim(data)
head(data)

mean(data$N)
mean(data$quadrant)

data$species <- as.factor(data$species)
species <- levels(data$species)
species


# 1 is saying true or false,, as in this a specific catgeory 
species==species[1]
data$species[data$species==species[1]]


#bascially I am grouping right noe
data$species==species[2]

#taking my groupings and giving it a name 
A.rup<-length(data$species[data$species==species[1]])
L.gib<-length(data$species[data$species==species[2]])
L.mac<-length(data$species[data$species==species[3]])
M.sal<-length(data$species[data$species==species[4]])
M.sax<-length(data$species[data$species==species[5]])
P.fla<-length(data$species[data$species==species[6]])

#grouping all of my separate groups 
species.obs <- data.frame(sp=species,n=c(A.rup,L.gib,L.mac,M.sal,M.sax,P.fla))
species.obs

#SEOB look here again !!! mark this up !!!
data %>%
  group_by(species) %>%
  summarise(n = n())

species.n<- data %>%
  group_by(species) %>%
  summarise(n = n())
species.n

data %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

for(i in 1:10) print(i)

for(i in species){
  p <- data %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}

pdf("YooModule1")
for(i in species){
  p <- data %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
dev.off()

list.files(pattern=".pdf")
