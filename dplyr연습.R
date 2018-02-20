library(dplyr)
library(ggplot2)
setwd('c:\\easy_r')
exam <- read.csv('csv_exam.csv')
exam %>% filter(class ==1)
exam %>% filter(class ==2)
exam %>% filter(class !=1)
exam %>% filter(math >80)
exam %>% filter(english >=80)
exam %>% filter(class ==1 & math >=50)
exam %>% filter(class ==2 & english >=80)
exam %>% filter(class ==2 | english >=80)
exam %>% filter(class ==2 | class ==3 | class== 5)
exam %>% filter(class %in% c(1,3,5))
class1 <- exam %>% filter(class ==1)
class2<- exam %>% filter(class ==2)                
mean(class1$math)                
mean(class2$math)
library(ggplot2)
mpg
hw1 <- mpg %>% filter (displ >=4)
hw2 <- mpg %>% filter (displ <=4)
mean(hw1$hwy)
mean(hw2$hwy)
a1 <- mpg %>% filter (manufacturer =='audi')
t1 <- mpg %>% filter (manufacturer =='toyota')
mean(a1$cty)
mean(t1$cty)
cfh_m <- mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
mean(cfh_m$hwy)
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% select(id, math) %>% head            
exam %>% filter(class ==1) %>% select(english)
exam %>%
  filter(class == 1) %>%
  select(english)

m_cc <- mpg %>% select(class,cty) 
m_cc %>% head(10)
m_ccs <- m_cc %>% filter(class =='suv')
m_ccc <- m_cc %>% filter(class =='compact')
mean(m_ccs$cty)
mean(m_ccc$cty)
exam %>% arrange(math)
exam %>% arrange(desc(math))

#혼자서해보기
mpg %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)


test1 <- data.frame(id=c(1,2,3,4,5), midterm = c(60,80,70,90,85))
exam %>% mutate(total = math + english + science, mean = (math+english + science)/3) %>% head
exam %>% mutate(test = ifelse(science >=60, 'pass','fail'))%>% head

mpg2 <- mpg %>% mutate(sum1= cty+hwy) %>% mutate(mean1= sum1/2) %>% arrange(desc(mean1)) %>% head(3) 
mpg2

exam %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n= n())
mpg %>% 
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty) %>%
  head(10))
mpg %>%
  group_by(manufacturer) %>%
  filter(class =='suv') %>%
  mutate(mt = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(mt))%>%
  arrange(desc(mean_tot)) %>%
  head(5)

#혼자서해보기
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(mean_cty)
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(mean_hwy) %>%
  head(3)
mpg %>%
  group_by(manufacturer)%>%
  filter(class=='compact') %>%
  summarise(n=n()) %>%
  arrange(desc(n))
  
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85))
test2 <- data.frame(id =c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1;test2
total <- left_join(test1,test2, by ='id')
total
name <- data.frame(class=c(1,2,3,4,5),
                   teacher= c('kim','lee','park','choi','jung'))
name
exam_new <- left_join(exam,name, by ='class')
exam_new

group_a <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85))
group_b <-data.frame(id = c(6,7,8,9,10),
                     test=c(70,83,65,95,80))
group_all <-bind_rows(group_a,group_b)
group_all

#혼자서해보기
fuel <- data.frame(fl=c('c','d','e','p','r'), price_fl= c(2.35,2.38,2.11,2.76,2.22),stringsAsFactors=F)
mpg_f <- left_join(mpg, fuel, by = 'fl')
mpg_f %>%
  select(model,fl,price_fl) %>%
  head(5)

#혼자서해보기
#문제1
midwest <- data.frame(ggplot2 :: midwest)
midwest_new <- midwest %>% mutate(mi_per = (poptotal-popadults)/poptotal)
#문제2
midwest_new %>% group_by(county) %>% arrange(desc(mi_per)) %>% head(5)
#문제3
midwest_new <- midwest_new %>% mutate(mi_gra = ifelse(mi_per >= 0.4, 'large', ifelse(mi_per >=0.3,'middle','small')))                             
midwest_new %>% group_by(mi_gra) %>%  summarise(county_num = length(county))
                                      