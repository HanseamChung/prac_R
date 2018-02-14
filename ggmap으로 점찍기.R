setwd('c:\\easy_r')
library(ggmap)
library(stringr)

loc <- read.csv('서울지하철2호선위경도정보.csv',header=T)
loc
center <- c(mean(loc$LON), mean(loc$LAT))
kor <-get_map(center,zoom=11, maptype = 'roadmap')
kor.map <- ggmap(kor) +geom_point(data=loc,aes(x=LON,y=LAT),
                                 size=3,alpha=0.7)
kor.map+geom_text(data=loc, aes(x= LON, y= LAT+0.005,label=익명),size=3)
ggsave('c:\\easy_r/line2.png',dpi=500)
