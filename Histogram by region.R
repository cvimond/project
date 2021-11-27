#Histogram by region

library(ggplot2)

#MHI
setwd("~/R/project/MHI")
M_Meta <- read.csv("MHI Meta.csv")
M_Meta
ggplot(M_Meta, aes(DepthInMeters)) + geom_histogram()
ggplot(M_Meta, aes(DepthInMeters)) + geom_histogram(binwidth = 250)
ggplot(M_Meta, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))


#NWHI
setwd("~/R/project/NWHI")
N_Meta <- read.csv("NWHI Meta.csv")
N_Meta
ggplot(N_Meta, aes(DepthInMeters)) + geom_histogram()
ggplot(N_Meta, aes(DepthInMeters)) + geom_histogram(binwidth = 100)
ggplot(N_Meta, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))


#EEZ
setwd("~/R/project/EEZ")
E_Meta <- read.csv("EEZ Meta.csv")
E_Meta
ggplot(E_Meta, aes(DepthInMeters)) + geom_histogram()
ggplot(E_Meta, aes(DepthInMeters)) + geom_histogram(binwidth = 100)
ggplot(E_Meta, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))

