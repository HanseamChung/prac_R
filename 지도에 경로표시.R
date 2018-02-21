setwd('c:\\easy_r')
library(ggmap)
library(ggplot2)

jeju <- read.csv('제주도여행코스_1일차.csv',header=T)
jeju

jeju1 <- get_map('Hallasan',zoom=10,maptype ='hybrid')
jeju.map <- ggmap(jeju1) +geom_point(data=jeju, aes(x=LON, y=LAT), size= 3, alpha=0.7,col='red')
jeju.map + geom_path(data=jeju, aes(x=LON, y=LAT), size= 1, linetype=2, col= 'blue')+geom_text(data=jeju, aes(x=LON, y=LAT+0.01, label=장소), size= 3)
