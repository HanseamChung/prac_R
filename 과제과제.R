x<- 1:3
y <- 3:1
plot(x,y,xlim=c(1,10),ylim=c(1,5),xlab='x축 값', ylab='y축 값', main='Plot Text')

v1 <- c(100,130, 120, 160,150)
plot(v1,type='o',col='red',ylim=c(0,200), axes=FALSE,ann=FALSE)

axis(1,at=1:5, lab=c('NON','TUE','WED','THU','FRI'))
axis(2,ylim=c(0,200))

title(main='FRUIT',col.main='red',font.main=4)
title(xlab='DAY',col.lab='black')
title(ylab='PRICE',col.lab='blue')

v1
par(mfrow=c(1,3))
plot(v1,type='o')
plot(v1,type='s')
plot(v1,type='l')
pie(v1)
plot(v1,type='o'     )
barplot(v1)

a<-c(1,2,3)
plot(a,xlab='aaa')
par(mgp=c(0,1,0))

plot(a,xlab = 'aaa')
par(oma=c(1,2,3,4))
plot(a,xlab = 'aaa')

par(mfrow=c(1,1))
v1 <- c(1,2,3,4,5)
v2 <-c(5,4,3,2,1)
v3<-c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,10))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type = 'l',col='green')

#1-1
prac1 <- c(3,4,5,6,7) 
plot(prac1)
#1-2
prac2 <- c(3,3,4,4)
plot(prac2)
#1-3
plot(c(3,3,3),c(2,3,4))
#1-4
plot(c(10,20,30,40,50,60,70,80,90),c(10:2))
#1-5
xxx <- c(2,4,6,8)
yyy <- c(16,17,19,18)
plot(xxx,yyy,xlim=c(0,10),ylim=c(15,20))

#2-1
par(mgp=c(4,2,1))
plot(xxx,yyy,xlim=c(0,10),ylim=c(15,20))

#2-2
par(oma=c(0,0,0,0))
plot(xxx,yyy,xlim=c(0,10),ylim=c(15,20))

#3-1
x <- c(12,13,14,15,17,17,18)
y <- c(30,31,33,32,28,27,30)
plot(x,y,xlim=c(10,20),ylim = c(26,34),xlab='7월의 날짜(일)', ylab='최고 기온',main='일주일간 최고 기온변화')
#3-2
x <- c(1.0,2.0,2.0)
y <- c(99,98,100)
plot(x,y,xlim=c(0.0,3.0),ylim = c(95,100),xlab='4학년(반)', ylab='점수(점)',main='4학년 1~3등 반 분포')

#4-1
s1 <- c(5,7,7,6,1)
