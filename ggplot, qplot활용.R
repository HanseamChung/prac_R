library(ggplot2)
miw <- as.data.frame(ggplot2::midwest)
head(miw)
miw_new <- as.data.frame(ggplot2::midwest)
miw_new <- rename(miw_new, total=poptotal,  asian=popasian)
miw_new
miw_new$percent <- miw_new$asian / miw_new$total
table(miw_new$percent)
qplot(miw_new$percent)


map <- apply(miw_new[29],2,mean)
miw_new$test <- ifelse(miw_new$percen > map,'large','smal')
table(miw_new$test)
qplot(miw_new$test)
