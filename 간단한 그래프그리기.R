x <- c(1,2,3,4)
barplot(x)
x <- matrix(c(5,4,3,2),2,2)
x
barplot(x,beside=T, names= c(5,3), col=c('green','yellow'))
x <- matrix(c(5,4,3,2),2,2)
barplot(x,names=c('가','나'),col=c('green','yellow'),ylim=c(0,12))
x
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)

qty <- data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
qty
barplot(as.matrix(qty),main="Fruit's Sales QTY", beside = T, col= rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c('NON','TUE','WED','THU','FRI'),cex=0.8,fil = rainbow(nrow(qty)))

barplot(t(qty),main="Fruits sales QTY", ylim=c(0,900),col=rainbow(length(qty)),space=0.1,cex.axis=0.8,las=1,names.arg=c('MON','TUE','WED','THU','FRI'),cex=0.8))
legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty)))

peach <- c(180,200,250,198,170)
colors <- c()
for (i in 1:length(peach))
  {if (peach[i]>= 200)
    {colors <- c(colors,'red')}
    else if (peach[i]>=180)
    {colors <- c(colors,'yellow')}
   else
   {colors <- c(colors,'green')}
}  

height <- c(182,175,167,172,163,178,181,166,159,155)
hist(height,main ='histogram of height')

par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist,main='plot')

par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius = 1)
pie(p1,radius = 1,angle=90)
pie(p1,radius = 1, init.angle = 90,col = rainbow(length(p1)),label=c('Week1','Week2','Week3','Week4'))

pct <- round(p1/sum(p1)*100,1)
lab <- paste(pct,'%')
pie(p1,radius = 1, init.angle = 90,col = rainbow(length(p1)),label=lab)
legend(1,1.1,c('Week1','Week2','Week3','Week4'),cex=0.5,fill=rainbow(length(p1)))

pct <- round(p1/sum(p1)*100,1)
lab1<-c('Week1','Week2','Week3','Week4')
lab2 <- paste(lab1,'\n',pct,'%')
pie(p1,radius = 1, init.angle = 90,col = rainbow(length(p1)),label=lab2)


#install.packages('plotrix')
library(plotrix)

p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,'%')
pie3D(p1,main='3D Pie Chart',col = rainbow(length(p1)),cex=0.5,labels=f_label,explode=0.05)
legend(0.5,1,c('MON','TUE','WED','TUE','FRI'),cex=0.6,fill=rainbow(length(p1)))


v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v2 <- c(11,20,15,18,13)
boxplot(v1,v2,v3,col=c('blue','yellow','pink'),names=c('Blue','Yellow','Pink'),horizontal = T)

#결측치 정제하기
df <- data.frame(sex=c('M','F',NA,'M','F'),
                 score=c(5,4,3,4, NA))
df
is.na(df)
table(is.na(df))
mean(df$score)
sum(df$score)
