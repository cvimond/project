#Histogram by region


#MHI
Mdata <- read.csv("MHI Meta copy.csv")
Mdata
ggplot(Mdata, aes(DepthInMeters)) + geom_histogram()
ggplot(Mdata, aes(DepthInMeters)) + geom_histogram(binwidth = 250)
ggplot(Mdata, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))


#NWHI
N_data <- read.csv("NWHI.csv")
N_data
ggplot(NWHI, aes(DepthInMeters)) + geom_histogram()
ggplot(NWHI, aes(DepthInMeters)) + geom_histogram(binwidth = 100)
ggplot(NWHI, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))


#EEZ
E_data <- read.csv("EEZ.csv")
E_data
ggplot(E_data, aes(DepthInMeters)) + geom_histogram()
ggplot(E_data, aes(DepthInMeters)) + geom_histogram(binwidth = 100)
ggplot(E_data, aes(DepthInMeters)) + geom_histogram()+
  coord_cartesian(xlim =c(100,1400))