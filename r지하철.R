#getwd()
setwd('c:/easy_r')
libs <- c('ggplot2', 'ggmap','jsonlite')

install.packages(libs)
unlist(lapply(libs, require, character.only=TRUE))

subway <- read.csv('c:/easy_r/subway.csv', header = TRUE, stringsAsFactors = FALSE, fileEncoding = 'UTF-8')
#head(str(subway))


#정수형변수 표준서식변환
class(subway[,'income_date']) <- 'character'
subway[,'income_date'] <- as.Date(subway[,'income_date'], format='%Y%m%d')
unique(format(subway[,'income_date'], '%Y'))



idx <- format(subway[,'income_date'], '%Y') == '2014'
unique(format(subway[idx, 'income_date'], '%m'))
subway2 <- subset(subway, subset = format(income_date, '%Y') != '2014')
sort(unique(subway[,'stat_name']))



idx <- grep( '\\(' , subway2[,'stat_name'])
unique(subway2[idx,'stat_name'])



stat_name <- subway2[,'stat_name']
tmp <- sapply(subway2[idx,'stat_name'], strsplit, '\\(', USE.NAMES=FALSE)
stat_renamed <- sapply(tmp, function(x) x[1])
subway2[idx, 'stat_name'] <- stat_renamed

year <- format(subway2[,'income_date'], '%Y')
month <- format(subway2[,'income_date'], '%m')
subway2 <- cbind(subway2, year, month)



subname <- read.csv('c:/easy_r/subway_latlong.csv', header=TRUE, stringsAsFactors = FALSE, skip=1, fileEncoding='UTF-8')
str(subname)
head(sort(unique(subname[,'STATION_NM'])),10)

Line <- tapply(subname[,'STATION_NM'], subname[,'LINE_NUM'], unique)
sapply(Line, head)



agg_fun <- function(vec,dat){
  sub_Line <- dat[dat[,'stat_name'] %in% vec,]
  tot <- aggregate(on_tot ~ year + stat_name, sub_Line, sum)
  return( tot )
}




total <- lapply(Line[1:8], FUN=agg_fun, dat=subway2)
df1 <- lapply(total, xtabs, formula = on_tot ~ stat_name + year)
lapply(df1, head)

cum_total <- lapply(total, xtabs, formula = on_tot ~ stat_name)
cum_total_vec <- unlist(cum_total)

names(cum_total_vec) <- unlist(lapply(strsplit(names(cum_total_vec),'\\.'), function(x) x[2]))

line_num <- factor(rep(1:8, lapply(cum_total, length)), labels=paste0(1:8, '호선'))

df2 <- data.frame(stat_name=names(cum_total_vec), line_num=line_num, on_tot=cum_total_vec, stringsAsFactors = FALSE)
df2$stat_name <- factor(df2$stat_name,levels=df2$stat_name)

#plot.new()
#dev.new()
plt <- ggplot(df2, aes(x=stat_name, y=on_tot, fill = line_num))
plt + theme_bw() + geom_bar(stat='identity', colour='white') + scale_x_discrete('지하철역', labels=NULL) + ylab('탑승객수') + scale_fill_discrete(name=c('노선'))



idx_top10 <- cum_total_vec >= sort(cum_total_vec, decreasing=TRUE)[10]
cum_total_vec[idx_top10]

df3 <- subset(df2, subset = idx_top10)
lim <- c(0, max(df2$on_tot))
plt <- ggplot(df3, aes(stat_name, y=on_tot, fill=line_num))
plt + geom_bar(stat='identity', colour='white') + xlab('상위 10개 지하철역') + scale_y_continuous('탑승객수', lim=lim) + scale_fill_discrete(name=c('노선'))


idx_bot10 <- cum_total_vec <= sort(cum_total_vec, decreasing=FALSE)[10]
cum_total_vec[idx_bot10]

df4 <- subset(df2, subset = idx_bot10)
plt <- ggplot(df4, aes(stat_name, y=on_tot, fill=line_num))
plt + geom_bar(stat='identity', colour='white') + xlab('하위 10개 지하철역') + scale_y_continuous('탑승객수', lim=lim) + scale_fill_discrete(name=c('노선'))



stat_top10_2013 <- subset(subway2, subset = stat_name %in% names(cum_total_vec[idx_top10]) & year == '2013', select = c('stat_name', 'on_tot', 'month'))
stat_top10_2013 <- aggregate(on_tot ~ month + stat_name, stat_top10_2013, sum)

plt <- ggplot(stat_top10_2013, aes(x=month, y=on_tot, colour=stat_name, group=stat_name))
plt <- plt + theme_classic() + geom_line() + geom_point(size=6, shape=19,alpha=0.5)
plt + scale_x_discrete('2013년', labels=paste0(unique(as.numeric(month)),'월')) + ylab('월별 탑승객수') + scale_colour_discrete(name=c('지하철역'))




stat_bot10_2013 <- subset(subway2, subset = stat_name %in% names(cum_total_vec[idx_bot10]) & year == '2013', select = c('stat_name', 'on_tot', 'month'))
stat_bot10_2013 <- aggregate(on_tot ~ month + stat_name, stat_bot10_2013, sum)

plt <- ggplot(stat_bot10_2013, aes(x=month, y=on_tot, colour=stat_name, group=stat_name))
plt <- plt + theme_classic() + geom_line() + geom_point(size=6, shape=19,alpha=0.5)
plt + scale_x_discrete('2013년', labels=paste0(unique(as.numeric(month)),'월')) + ylab('월별 탑승객수') + scale_colour_discrete(name=c('지하철역'))




subway3 <- merge(subway2[,c('stat_name', 'income_date', 'on_tot', 'year', 'month')], subname[, c('STATION_NM', 'LINE_NUM','XPOINT_WGS','YPOINT_WGS')], by.x = 'stat_name', by.y = 'STATION_NM')

tmp1 <- aggregate(on_tot ~ LINE_NUM + stat_name, subway3, sum, na.rm=TRUE)
tmp2 <- aggregate(on_tot ~ LINE_NUM, tmp1, mean, na.rm=TRUE)
tmp2


col <- c('red','springgreen2','orange','blue','purple','brown','khaki','deeppink','yellow','deepskyblue')
pie(tmp2$on_tot, labels = paste0(unique(tmp2$LINE_NUM), '호선'), col=col, border = 'lightgray', main = '노선별 평균 지하철 탑승객 수')




yearmonth <- paste(subway3$year, subway3$month, '01', sep='-')
yearmonth <- as.Date(yearmonth)
tmp3 <- cbind(subway3, yearmonth)
tmp3$LINE_NUM <- paste0(tmp3$LINE_NUM, '호선')
tmp4 <- aggregate(on_tot ~ LINE_NUM + yearmonth, tmp3, sum, na.rm = TRUE)

plt <- ggplot(tmp4, aes(x=yearmonth, y=on_tot, fill=LINE_NUM))
plt <- plt + geom_area(colour = 'white', size=0.2)
plt <- plt + scale_fill_manual(name='노선', values=col)
plt + theme_classic() + xlab('연') + ylab('누적승객수')







#ggmap
library(ggmap)
dat1 <- subset(subway3, income_date == '2012-05-08', select=c('XPOINT_WGS', 'YPOINT_WGS', 'on_tot', 'stat_name', 'LINE_NUM'))
Map_Seoul <- get_map(location=c(lat=37.55, lon=126.97), zoom = 11, maptype='roadmap')

MM <- ggmap(Map_Seoul)
MM2 <- MM + geom_point(aes(x=YPOINT_WGS, y = XPOINT_WGS, size = on_tot, colour = as.factor(LINE_NUM)), data = dat1)

MM2 + scale_size_area(name=c('탑승객수')) + scale_colour_discrete(name=c('노선')) + labs(x = '경도', y = '위도')




total <- lapply(Line[1:8], FUN=agg_fun, dat=subway2)
lapply(total, xtabs, formula = on_tot ~ stat_name + year)


#plot.new()
#dev.new()

idx <- which(cum_total_vec >= sort(cum_total_vec, decreasing = TRUE)[10])
stat_top10_2013 <- subset(subway2, subset = year=='2013' & stat_name %in% names(cum_total_vec[idx]))

dat2 <- aggregate(on_tot ~ stat_name, stat_top10_2013, sum)
dat2 <- merge(dat2, subname, by.x='stat_name', by.y = 'STATION_NM')

MM3 <- MM + geom_point(aes(x = YPOINT_WGS, y= XPOINT_WGS, size=on_tot), alpha = 0.5, data = dat2)
MM3 + scale_size_area(name = c('탑승객수'), max_size = 15) + geom_text(aes(x=YPOINT_WGS, y = XPOINT_WGS, label = stat_name), colour='red', vjust = 3, size = 3.5, fontface = 'bold', data = dat2) + labs(x='경도', y='위도')




#회귀분석

dat4_1 <- subset(subway2, subset = year=='2013', select=c('stat_name', 'income_date', 'on_tot'))
dat4_2 <- subset(subname, subset = STATION_NM %in% unique(dat4_1[,'stat_name']), select=c(STATION_NM, LINE_NUM, XPOINT_WGS, YPOINT_WGS))

dat4 <- merge(dat4_1, dat4_2, by.x='stat_name', by.y='STATION_NM')
month <- format(dat4[,'income_date'], '%m')
day <- format(dat4[,'income_date'], '%a')
dat4 <- cbind(dat4, month, day)
head(dat4)
lm.res <- lm(on_tot ~ as.factor(stat_name) + as.factor(LINE_NUM) + month + day, data=dat4)


stdres <- rstandard(lm.res)
boxplot(stdres, outline=TRUE)

idx <- order(abs(stdres), decreasing=TRUE)[1:2]
dat4[idx,]

row_index_out <- rownames(dat4[idx,])

dat_worldcup <-subset(dat4,  subset= stat_name =='월드컵경기장')
dat_worldcup <- dat_worldcup[order(dat_worldcup$income_date),]
dat_out <- subset(dat_worldcup, subset=rownames(dat_worldcup) %in% row_index_out)
plot(on_tot ~ income_date, data=dat_worldcup, type='l', ylab='탑승객수', xlab='')
points(on_tot ~ income_date, data= dat_out, col='red', pch=19)
text(x=dat_out$income_date, y=dat_out$on_tot, labels=dat_out$income_date, adj=c(1.1,1.1), cex=0.8)
