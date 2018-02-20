setwd('C:\\easy_r')
#install.packages('foreign')
library(readxl)
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

#1. 분석준비
raw_welfare <- read.spss(file='koweps_hpc10_2015_beta1.sav',to.data.frame = T)

welfare <- raw_welfare

head(welfare)
tail(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare, sex= h10_g3,
                  birth = h10_g4,
                  marriage= h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)
#2. 성별에 따른 월급관계
#이상치확인
class(welfare$sex)
table(welfare$sex)
#이상치 결측처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
#결측치확인
table(is.na(welfare$sex))
##성별항목 이름부여
welfare$sex <- ifelse(welfare$sex ==1, 'male','female')
table(welfare$sex)
qplot(welfare$sex)
class(welfare$income)
##이상치 확인
summary(welfare$income)
#이상치 결측처리
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
##결측치 확인
table(is.na(welfare$income))

##성별 월급 평균표 만들기
sex_income <- welfare %>%  
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income
##그래프 만들기
ggplot(data=sex_income, aes(x= sex, y= mean_income)) +geom_col()



#3. 나이와 월급의 관계 
##변수 검토하기
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
##전처리
###이상치확인
summary(welfare$birth)
###결측치 확인
table(is.na(welfare$birth))
welfare$birth <- ifelse(welfare$birth %in% c(0,9999), NA, welfare$birth)
table(is.na(welfare$birth))
##파생변수 만들기 - 나이
welfare$age <- 2018-welfare$birth +1
summary(welfare$age)
qplot(welfare$age)
##나이에 따른 월급 평균표 만들기
age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))
head(age_income)
##그래프 만들기
ggplot(data= age_income, aes(x= age, y=mean_income)) +geom_line()

#4.연령대별 월급차이
##파생변수 만들기 - 연령대
welfare <- welfare %>% 
  mutate(ageg= ifelse(age<30, 'young',
                      ifelse(age <= 59, 'middle','old')))
table(welfare$ageg)
##연령대별 월급 평균표 만들기
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income= mean(income))
ageg_income
ggplot(data = ageg_income, aes(x= ageg, y= mean_income)) +geom_col() +
  scale_x_discrete(limits = c('young','middle','old'))

#5. 연령대 및 성별 월급 차이
##연령대 및 성별 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income =mean(income))
sex_income
##그래프 만들기
ggplot(data= sex_income, aes(x= ageg, y = mean_income, fill= sex)) + geom_col(position = 'dodge') + scale_x_discrete(limits= c('young','middle','old'))
##나이 및 성별 월급 차이 분석하기
sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))
head(sex_age)
ggplot(data = sex_age, aes(x= age, y = mean_income, col= sex)) +geom_line()


#6. 직업별 월급 차이
##변수검토하기
class(welfare$code_job)
table(welfare$code_job)
##전처리
library(readxl)
list_job <- read_excel('Koweps_Codebook.xlsx',col_names = T, sheet =2)
head(list_job)
dim(list_job)
##welfare에 직업명 결합
welfare<- left_join(welfare, list_job,id = 'code_job')
welfare %>%
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)
##직업별 월급 평균표 만들기
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))
head(job_income)
## 상위 10개 추출
top10 <- job_income %>%  
  arrange(desc(mean_income)) %>% 
  head(10)
top10
##그래프 만들기
ggplot(data = top10, aes(x = reorder(job, mean_income), y= mean_income)) + geom_col()+coord_flip()
##하위 10위 추출
bottom10 <-job_income %>%  
  arrange((mean_income)) %>% 
  head(10)
bottom10
ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y= mean_income)) + geom_col()+coord_flip() + ylim(0,850)



#7.성별 직업선호<<오류>>
##전처리(re)
library(readxl)
list_job <- read_excel('Koweps_Codebook.xlsx',col_names = T, sheet =2)
head(list_job)
dim(list_job)
##welfare에 직업명 결합
welfare<- left_join(welfare, list_job,id = 'code_job')
welfare %>%
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)
##남성 직업 빈도표 만들기
job_male <- welfare %>% 
  filter(!is.na(job)& sex =='male') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male
##여성직업 빈도표 만들기
job_female <- welfare %>% 
  filter(!is.na(job)& sex =='female') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female
##그래프 만들기
##남성 직업 빈도 상위 10개
ggplot(data= job_male, aes(x= reorder(job,n), y= n)) + geom_col() + coord_flip() +ylim(0,600)
##여성 직업 빈도 상위 10개
ggplot(data= job_female, aes(x= reorder(job,n), y= n)) + geom_col() + coord_flip()



#8. 종교유무에 따른 이혼율
##변수검토하기
class(welfare$religion)
table(welfare$religion)
##전처리(종교이름 부여)
welfare$religion <- ifelse(welfare$religion ==1, 'yes','no')
table(welfare$religion)
qplot(welfare$religion)
##변수검토하기
class(welfare$marriage)
table(welfare$marriage)
##전처리(이혼여부 변수 만들기)
welfare$group_marriage <- ifelse(welfare$marriage==1,'marriage',ifelse(welfare$marriage==3,'divorce',NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
##종교유무에 따른 이혼율 분석
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion,group_marriage) %>% 
  summarise(n= n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct= round(n/tot_group*100,1))
religion_marriage
##이혼율 표만들기
divorce <- religion_marriage %>% 
  filter(group_marriage =='divorce') %>% 
  select(religion,pct)
divorce
ggplot(data = divorce, aes(x= religion, y= pct)) +geom_col()
##연령대별 이혼율 표만들기
ageg_merriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group= sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_merriage
##연령대별 이혼율 그래프만들기 (초년제외,이혼추출)
ageg_divorce <- ageg_merriage %>% 
  filter(ageg !='young' & group_marriage =='divorce') %>%   select(ageg,pct)
ageg_divorce
ggplot(data=ageg_divorce, aes(x=ageg,y=pct)) +geom_col()
##연령대 및 종교 유무에 따른 이혼율 표 만들기
ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg!='young') %>%  group_by(ageg,religion,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_religion_marriage
##연령대 및 종교 유무별 이혼율 표 만들기2
df_divorce <- ageg_religion_marriage %>% 
  filter(group_marriage =='divorce') %>% 
  select(ageg,religion,pct)
df_divorce
ggplot(data= df_divorce, aes(x=ageg,y=pct,fill=religion)) +geom_col(position = 'dodge')
