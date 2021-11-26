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
DataInfo (NWHI_dives, datatype = 'abundance')
NWHI_dives <- iNEXT (NWHI_dives, datatype = 'abundance')
plot (NWHI_dives)

#iNEXT method 2 species abundance by dives
NWHI_dives = read.csv("NWHI_dives.txt")
NWHI_dives <- data.frame(NWHI_dives)

NWHI_dives <- iNEXT(NWHI_dives, q=0, datatype="abundance") # call iNEXT on the list

ggiNEXT(NWHI_dives, type=1) # Sample-size-based R/E curves

### iNEXT method 2 species abundance by features
NWHI_features = read.csv("NWHI_features.txt")
NWHI_features <- data.frame(NWHI_features)

NWHI_features <- iNEXT(NWHI_features, q=0, datatype="abundance") # call iNEXT on the list

ggiNEXT(NWHI_features, type=1) # Sample-size-based R/E curves
