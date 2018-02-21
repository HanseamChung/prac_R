setwd('c:\\easy_r')
library(ggmap)
library(grid)
pop <- read.csv('지역별인구현황_2014_4월기준.csv', header=T)
lon <- pop$LON
lat <- pop$LAT
data<- pop$총인구수
df <- data.frame(lon,lat,data)
df

map5 <- get_map('Jeonju',zoom=7, maptype = 'roadmap')
map5<- ggmap(map5)
map5 + stat_bin2d(aes(x=lon,y=lat,colour=data,fill=factor(data),size=data),data=df)

                  