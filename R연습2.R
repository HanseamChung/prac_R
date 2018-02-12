a<-11
b<-22
setwd('c:\\easy_r')
getwd()
var1 <- c(1, 2, 5, 7, 8)
var2 <- c(1:5)
var3 <- seq(1, 5)
var4 <- seq(1, 10, by =2)
var1+2
var1-var2
str1 <- 'a'
str1
str3 <- 'Hello World!'
str4 <- c('a','b','c')
x <- c(1,2,3)
x
mean(x)
max(x)
min(x)
str5 <- c('Hello!', 'World', 'is', 'good!')
str5
paste(str5, collapse =',')
paste(str5, collapse = ' ')
x_mean <- mean(x)
str5_paste <- paste(str5, collapse = ' ')
x <- c('a', 'a', 'b', 'c')
x
qpolt(x)
qplot(x)
libra(ggplot2)
library(ggplot2)
qplot(x)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = drv)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom='line')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot', colour = drv)
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot', colour = hwy)
?qplot
date2 <- seq(from=as.Date('2014-01-01'),to=as.Date('2014-05031'),by='month'))
date2
