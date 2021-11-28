library(tidyverse)

install.packages("geometry")
library(geometry)
install.packages("factoextra")
library(factoextra)

library(ggrepel) #provides geoms for ggplot2 to repel overlapping text labels - prevent warming of too many overlaps

# set working directory
setwd("~/R/project/EEZ")

### BY SPECIES (SCIENTIFIC NAME)

# read feature_species data and format as data frame
EEZ_species_features = read.csv("EEZ_features_species.txt")
EEZ_S_F = data.frame(EEZ_species_features)
head(EEZ_S_F)

# do we need to compute outcome using formula? ????0+????1×????+????2×????+????3×????+????4×????

# PCA for species richness  (or species presence or species abundance - which is most appropriate?) vs features
EEZ_S_F_pca = prcomp(EEZ_S_F, scale=TRUE)
summary(EEZ_S_F_pca)

# structure of EEZ features_species data 
str(EEZ_S_F_pca) 

#add ggrepel infinite overlap option 
options(ggrepel.max.overlaps = Inf)

# visualize eigenvalues to show percentage of variances explained by each PC 
# i.e., how much variance (percent) in species richness (or presence or abundance?) is explained by each of the three features  
fviz_eig(EEZ_S_F_pca)

# individual point graph - visualized each point with color by quality of representation 
# i.e., points (aka species) are grouped together based on similar profile

fviz_pca_ind(EEZ_S_F_pca,
             col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)    # Avoid text overlapping

# variable graph - color gradient to visualize level of contribution of each PC 
# how much does each feature contribute to species richness (or presence or abundance?)
fviz_pca_var(EEZ_S_F_pca,         
             col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)


#biplot of individual points (species) and variables (features)
fviz_pca_biplot(EEZ_S_F_pca,
                col.var = "#2E9FDF",
                col.ind = "#696969",
                repel = TRUE)

