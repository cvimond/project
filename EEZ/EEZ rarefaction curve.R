install.packages ('iNEXT')
library(iNEXT)
library(tidyverse)
install.packages('devtools')
library(devtools)
library(dplyr)

library(ggplot2)
#Fix Bug
source ("https://gist.githubusercontent.com/zdealveindy/f30fa1f0264eabe95828218f61e63df0/raw/333937c2155dc3b8afddd1663e266b6183062602/plot.iNEXT_quickfix")


### iNEXT method 1 species abundance by dives
EEZ_dives = read.csv("EEZ_dives.txt")
DataInfo (EEZ_dives, datatype = 'abundance')
EEZ_dives <- iNEXT (EEZ_dives, datatype = 'abundance')
plot (EEZ_dives)

### iNEXT method 2 species abundance by dives
EEZ_dives = read.csv("EEZ_dives.txt")
EEZ <- data.frame(EEZ_dives)
# call iNEXT on the list
EEZ_dives <- iNEXT(EEZ_dives, q=0, datatype="abundance")
# Sample-size-based R/E curves
ggiNEXT(EEZ_dives, type=1)

### iNEXT method 2 species abundance by features
EEZ_features = read.csv("EEZ_features.txt")
EEZ_features <- data.frame(EEZ_features)
# call iNEXT on the list
EEZ_features <- iNEXT(EEZ_features, q=0, datatype="abundance")
# Sample-size-based R/E curves
ggiNEXT(EEZ_features, type=1)
