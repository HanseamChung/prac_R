setwd('c:\\easy_r')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()
mergeUserDic(data.frame(readLines('제주도여행지.txt'),'ncn'))

             