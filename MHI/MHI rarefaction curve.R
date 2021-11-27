install.packages ('iNEXT')
library(iNEXT)
library(tidyverse)
install.packages('devtools')
library(devtools)
library(dplyr)

library(ggplot2)
#Fix Bug
source ("https://gist.githubusercontent.com/zdealveindy/f30fa1f0264eabe95828218f61e63df0/raw/333937c2155dc3b8afddd1663e266b6183062602/plot.iNEXT_quickfix")


#iNEXT method 1 species abundance
DataInfo (MHI_dives, datatype = 'abundance')
MHI_dives <- iNEXT (MHI_dives, datatype = 'abundance')
plot (MHI_dives)

# CHOSEN METHOD: iNEXT method 2 species abundance by dives
MHI_dives = read.csv("MHI_dives.txt")
MHI <- data.frame(MHI_dives)

MHI <- iNEXT(MHI_dives, q=0, datatype="abundance") # call iNEXT on the list

ggiNEXT(MHI, type=1) # Sample-size-based R/E curves

### iNEXT method 2 species abundance by features
MHI_features = read.csv("MHI_features.txt")
MHI_features <- data.frame(MHI_features)

MHI_features <- iNEXT(MHI_features, q=0, datatype="abundance") # call iNEXT on the list

ggiNEXT(MHI_features, type=1) # Sample-size-based R/E curves




### VEGAN rarecurve
install.packages("vegan")
library(vegan)

MHI_dives = read.csv("MHI_dives.txt")
MHI <- data.frame(MHI_dives)
MHI
summary(MHI)

S <- specnumber(MHI) # total number of species atin each sample (number of species per row inf site x spp matrix)

raremax <- min(rowSums(MHI)) # number of individuals per sample

Srare <- rarefy(MHI, raremax) # rarefy with raremax as input (Rarefied species richness)

# plot rarefaction results
plot(S, Srare, xlab = "Number of Individuals", ylab = "Species Diversity", main = "plot(rarefy(MHI, raremax))")
abline(0, 1)
rarecurve(MHI, step = 20, sample = raremax, col = "blue", cex = 0.6, main = "rarecurve()")

