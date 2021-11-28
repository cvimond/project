library(tidyverse)

install.packages("geometry")
library(geometry)

install.packages("factoextra")
library(factoextra)

library(ggrepel) #provides geoms for ggplot2 to repel overlapping text labels - prevent warming of too many overlaps

# set working directory
setwd("~/R/project/MHI")

### BY FAMILY 

# read feature_family data and format as data frame
MHI_family_features = read.csv("MHI_features_family.txt") # add family as col1 label  b/c woulnd't accept same format as species txt file
MHI_F_F = data.frame(MHI_family_features)
head(MHI_F_F)

## ERROR - SAME CODE AS SPECIES BUT DOES NOT ACCEPT "FAMILY" COLUMN WHEN IT DID FOR SPECIES - WANTS FAMILY CONVERTED TO NUMERIC?

# PCA for family vs features
MHI_F_F_pca = prcomp(MHI_F_F[2:4], scale=TRUE) # [2:4] SELECT 3 NUMERIC COLUMNS - NOT FAMILY B/C OF ERROR
summary(MHI_F_F_pca)

# structure of EEZ features_family data 
str(MHI_F_F_pca) 

#add ggrepel infinite overlap option 
options(ggrepel.max.overlaps = Inf)

# visualize eigenvalues to show percentage of variances explained by each PC 
# i.e., how much variance in family assignment (in percent) is explained by each of the three features  
fviz_eig(MHI_F_F_pca)

# individual point graph - visualized each point with color by quality of representation 
# i.e., points (aka family) are grouped together based on similar profile
fviz_pca_ind(MHI_F_F_pca,
             col.ind = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)    # Avoid text overlapping

# variable graph - color gradient to visualize level of contribution of each PC 
# how much does each feature contribute to family presence (abundance or richness?)
fviz_pca_var(MHI_F_F_pca,         
             col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

#biplot of individual points (family) and variables (features)
fviz_pca_biplot(MHI_F_F_pca, 
                col.var = "#2E9FDF",
                col.ind = "#696969",
                repel = TRUE)
