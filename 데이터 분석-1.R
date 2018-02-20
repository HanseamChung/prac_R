setwd('C:\\easy_r')
#실습문제 3
 <- c(65,90,98,88,78,60,59,72,82,84,86,92,77,72)
hist(score,main='histogram of score',xlab='score',ylab='Frequency')

age <- c(28,35,40,32,36,39,41,38,33,30,27,34,35,43)
hist(age,main='histogram of age',xlab='age',ylab='Frequency')

#실습문제 4
library(plotrix)
p1 <- c(24,18,17,9,8)
lab <-c('취직','친구/이성','학업성적','결혼','외모')
lab2 <- paste(lab,'\n',p1,'%')
pie3D(p1,col=rainbow(length(p1)), labels=lab2,main='20대 최근 관심',cex=0.5)
#legend(1,1.1,c('취직','친구/이성','학업성적','결혼','외모'),cex=0.5,fill=rainbow(length(p1))

#실습문제 5
v1 <- c(37.4,50.3,63.6,67.2,81.1)
v2 <- c(82.2,88.1,84.7,77.2,56.3)
boxplot(v1,v2,col=c('blue','yellow'),names=c('TV이용률','스마트폰 이용률'),horizontal=T)
