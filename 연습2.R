#install.packages('sqldf')
#install.packages('reshape2')
library(sqldf)
library(reshape2)
data1 <- read.csv('2013년_프로야구선수_성적.csv')
data1
data1 %>%
  group_by(팀) %>%
  summarise(average = mean(경기,na.rm= TRUE))
data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean),경기,타수)
fruits <- read.csv('fruits_10.csv',header=T)
fruits
melt(fruits,id='year')
melt(fruits,id=c('year','name'))
mtest <- melt(fruits,id=c('year','name'),variable.name='var_name',
              val.name='val_name')
mtest
dcast(mtest,year+name~var_name)

library(stringr)
fruits <- c('apple','Apple','banana','pineapple')
str_detect(fruits,'A')
str_detect(fruits,'^a')
str_detect(fruits,'e$')
str_detect(fruits,'^[Aa]')
str_detect(fruits,'[aA]')
str_detect(fruits,'[^A]')
str_detect(fruits,ignore.case('a'))
str_count(fruits,ignore.case('a'))
str_count(fruits,'a')
str_c('apple','banana')
str_c('Fruits :',fruits)
str_dup(fruits,3)
str_length(fruits)
str_locate('apple','a')
str_locate(fruits,'a')
str_replace('apple','p','*')
fruits <- str_c('apple','/','orange','/','banana')
fruits
str_split(fruits,'/')
str_sub(fruits,start=1,end=3)
str_sub(fruits,start=-5)
str_trim('apple banana berry ')
sqldf('SELECT * FROM Fruits WHERE Fruits=\'apples\'')
