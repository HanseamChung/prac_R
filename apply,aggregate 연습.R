install.packages('googleVis')
library(googleVis)
Fruits
aggregate(Sales~Year,Fruits,sum)
aggregate(Sales~Fruit,Fruits,sum)
aggregate(Sales~Fruit,Fruits,max)
aggregate(Sales~Fruit+Year,Fruits,max)
mat1 <- matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
mat1
apply(mat1,1,sum)
apply(mat1,2,sum)
apply(mat1[,c(2,3)],2,max)
list1<- list(Fruits$Sales)
list1
list2 <- list(Fruits$Profit)
lapply(c(list1,list2),max)
sapply(c(list1,list2),max)
Fruits
tapply(Sales,Fruits,sum)
attach(Fruits)
tapply(Sales,Fruits,sum)
tapply(Sales,Date,sum)
vec1 <- c(1,2,3,4,5)
vec2 <- c(10,20,30,40,50)
vec3 <- c(100,200,300,400,500)
mapply(sum,vec1,vec2,vec3)

Fruits
aggregate(Sales~Fruit,Fruits,mean)
aggregate(Expenses~Fruit,Fruits,max)
aggregate(Profit~Fruit,Fruits,min)
aggregate((Profit+Expenses)~Location,Fruits,mean)
aggregate(Profit~Fruit,Fruits,sum)
aggregate((Profit+Expenses)~Year,Fruits,mean)
aggregate(Expenses~Fruit,Fruits,mean)
aggregate(Profit~Location+Fruit,Fruits,mean)
aggregate(Sales~Location+Year,Fruits,sum)
aggregate(Expenses~Location+Fruit,Fruits,sum)
aggregate(Profit~Location+Year,Fruits,max)



#실습문제(2)보고서
#(apply)
data1 <- read.csv('data1.csv')
data1
apply(data1[,c(2:15)],2,sum)
apply(data1[,c(2:15)],1,sum)
apply(data1[,c(10:14)],2,sum)
apply(data1[,c(10:14)],1,sum)
d1 <- apply(data1[,c(2,7,12)],2,sum)
d1
d2 <- apply(data1[,c(2,7,12)],1,sum)
d2
#(Sapply)
sapply(data1[,c(10,14)],sum)
sapply(data1[,c(2,7,12)],sum)



data2 <-read.csv('1-4호선승하차승객수.csv')
data2
attach(data2)
tapply(승차,노선번호,sum)
tapply(하차,노선번호,sum)
apply(data2[,c(3,4)],2,sum)
tapply(하차,노선번호,sum)
###tapply(data2[,c(3,4)],mean)
apply(data2[3],2,max); apply(data2[4],2,min)
tapply(하차+승차,노선번호,min)

aggregate(승차+하차~노선번호,data2,sum)
aggregate(승차~노선번호,data2,sum)
aggregate(하차~노선번호,data2,sum)
aggregate(승차~노선번호,data2,mean)
aggregate(하차~노선번호,data2,min)
aggregate(승차+하차~노선번호,data2,max)