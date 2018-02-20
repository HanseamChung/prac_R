library(ggplot2)
library(dplyr)
ggplot(data= mpg, aes(x= displ, y= hwy)) + geom_point()
#x축 범위 3-6으로 지정
ggplot(data= mpg, aes(x= displ, y= hwy)) + geom_point() +xlim(3,6)
#x축 범위 3-6으로 지정,y축범위 10-30으로
ggplot(data= mpg, aes(x= displ, y= hwy)) + geom_point() +xlim(3,6)+ ylim(10,30)


##혼자서 해보기 188
#q1. cty~hwy 상관관계
ggplot(data= mpg, aes(x= cty, y= hwy)) + geom_point()
#q2. 전체 인구와 아시아 인구의 상관관계
ggplot(data=midwest, aes(x=poptotal, y= popasian))+geom_point() + xlim(0,500000) + ylim(0, 10000)


#집단별 평균표 만들기 => geom_col()
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg
#그래프 생성
ggplot(data = df_mpg, aes(x= drv, y = mean_hwy)) + geom_col()
#크기순으로 정렬
ggplot(data = df_mpg, aes(x= reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

##빈도 막대 그래프 => geom_bar()
#x축 범주 변수, y축 빈도
ggplot(data = mpg, aes(x=drv)) +geom_bar()
#x축 연속변수, y축 빈도
ggplot(dat=mpg, aes(x=hwy)) + geom_bar()


##혼자서 해보기 193p
#q1. suv별 도시연비 표시
suvv <- mpg %>% filter(class=='suv') %>% 
  group_by(manufacturer) %>% summarise(mean_cty = mean(cty)) %>%  arrange(desc(mean_cty)) %>% head(5)
suvv
ggplot(data=suvv, aes(x=reorder(manufacturer,-mean_cty), y= mean_cty)) +geom_col()
#q2. 차 종류별 빈도
ggplot(data=mpg, aes(x=class)) +geom_bar()

##선그래프 => geom_line()
ggplot(data = economics,aes(x= date, y= unemploy)) +geom_line()


##혼자서 해보기
#저축률의 시간에 따른 변화
ggplot(data = economics,aes(x= date, y= psavert)) +geom_line()

##상자 그림 => geom_boxplot()
ggplot(data=mpg,aes(x=drv, y= hwy)) + geom_boxplot()

##혼자서 해보기
csv1 <- mpg %>% filter(class==c('compact','subcompact','suv'))
ggplot(data=csv1, aes(x= class, y=cty)) +geom_boxplot()
