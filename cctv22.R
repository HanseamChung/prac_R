setwd('c:\\easy_r')
library(ggmap)
gangbuk <- read.csv('cctv2.csv', header=T)
g_m <- get_map('Daegu',zoom=12,maptype='roadmap')
gang.map<- ggmap(g_m) + geom_point(data=gangbuk,aes(x=LAT,y=LON),size=2,alpha=0.7,color='#980000')
gang.map                                   
