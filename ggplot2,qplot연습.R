exam <- read.csv('csv_exam.csv')
head(exam)
head(exam, 10)
tail(exam, 10)
View(exam)
dim(exam)
str(exam)
summary(exam)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

library(dplyr)
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
df_new <- df_raw
df_new
df_new <- rename(df_new, v2= var2)
df_new
mpg_new <- as.data.frame(ggplot2::mpg)
mpg_new <- rename(mpg_new, city = cty, highway = hwy)
head(mpg_new)

df <- data.frame(var1= c(4,3,8), var2=c(2,6,1))
df
df$var_sum <- df$var1 +df$var2
df
df$var_mean <- (df$var1 +df$var2)/2
df
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
mpg$test<-ifelse(mpg$total >= 20, 'pass', 'fail')

table(mpg$test)
qplot(mpg$test)
mpg$grade<-ifelse(mpg$total >= 30, 'A',
                  ifelse(mpg$total >= 20, 'B','C'))
head(mpg,20)                  
table(mpg$grade)
qplot(mpg$grade)
