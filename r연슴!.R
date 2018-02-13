setwd('C:\\easy_r')
scan1 <-scan('scan_1.txt')
scan1
scan2<- scan('scan_2.txt')
scan2
scan2 <- scan('scan_2.txt',what='')
scan2
scan3 <- scan('scan_3.txt',what='')
scan3
install.packages('readxl')
library(readxl)
df_csv_exam <- read.csv('csv_exam.csv',stringsAsFactors = F)
df_midterm <- data.frame(english= c(90,80,60,70),
                         math = c(50,60,100,20),
                         class= c(1,1,2,2))
df_midterm
write.csv(df_midterm,file='df_midterm.csv')
install.packages('googleVis')
library('googleVis')
install.packages('sqldf')
library('sqldf')
Fruits


df_exam <- read_excel('excel_exam.xlsx')
df_exam
mean(df_exam$english)
mean(df_exam$science)
df_exam <- read_excel('C:\\easy_r\\excel_exam.xlsx')
df_exam_novar <- read_excel('excel_exam_novar.xlsx', col_names=F)
df_exam_novar
df_exam <- read_excel('excel_exam.xlsx', sheet= 3)
df_exam_sheet <- read_excel('excel_exam.xlsx')
df_exam_sheet
txt1 <- read.csv('csv_test.txt')
txt1
txt2 <- readLines('csv_test.txt')
txt2
txt3 <- read.table('csv_test.txt')
txt3
txt3<- read.table('csv_test.txt',sep=',')
txt3
txt3<- read.table('csv_test.txt',sep=',',header=T)
txt3
txt1 <- readLines('write_test.txt')
write(txt1,'write_test2.txt')
txt2<-readLines('write_test2.txt')
txt2
txt1<-read.table('table_test.txt',sep=" ",header = T)
write.table(txt1,'table_test2.txt')
txt2 <- read.table('table_test2.txt',head=T)
txt2
txt1 <- read.csv('csv_test.csv')
save(df_midterm, file ='df_midterm.rda')
rm(df_midterm)
df_midterm
load('df_midterm.rda')
df_midterm
df_exam <-read_excel('excel_exam.xlsx')
df_csv_exam <- read.csv('csv_exam.csv')
load('df_midterm.rda')
