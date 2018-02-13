english <- c(90, 80, 60, 70)
english
math <- c(50, 60, 100, 20)
df_midterm <- data.frame(english, math)
df_midterm
class <- c(1,1,2,2)
df_midterm <- data.frame(english, math, class)
df_midterm
mean(df_midterm$english)
df_midterm <- data.frame(english=c(90, 80, 60, 70),
                         math=c(50,60, 100, 20),
                         class = c(1,1,2,2))
df_midterm
no <- c(1,2,3,4)
name <- c('Apple','Peach','Banana','Grape')
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(NO=no, NAME=name,PRICE=price,QTY=qty)
sales
sales2 <- matrix(c(1,'Apple',500,5,
                  2,'Peach',200,2,
                  3,'Banana',100,4,
                  4,'Grape', 50, 7),nrow=4,byrow=T)
sales2
df1 <- data.frame(sales2)
df1
names(df1) <- c('NO','NAME','PRICE','QTY')
df1
no <- c(1,2,3)
name <- c('apple','banana','peach')
price <- c(100,200,300)
df1 <- data.frame(NO=no,NAME=name,PRICE=price)
df1
df1 <- data.frame(name=c('apple','banana','cherry'),price=c(300,200,100))
df2 <- data.frame(name=c('apple','cherry','berry'),qty=c(10,20,30))
merge(df1,df2)
merge(df1,df2,all=T)
cbind(df1,df2)
cbind(df2,df1)
df1
new <- data.frame(name='mango',price=400)
df1 <- rbind(df1,new)
df1 <- rbind(df1,data.frame(name='berry',price=500))
df1
df1 <- cbind(df1,data.frame(qty=c(10,20,30,40,50)))
df1
df1 <- data.frame(NO=c(1, 2, 3),
                         NAME=c('apple','banana', 'peach'),
                         PRICE = c(100,200,300))
df2 <- data.frame(NO=c(10, 20, 30),
                  NAME=c('train','car', 'airplain'),
                  PRICE = c(1000,2000,3000))
df1 ; df2

s <- data.frame(name=c('김길동','강길동', '박길동'),
                  kor=c(100,90, 85),
                  mat = c(90,95,98),
                eng = c(80,98,100))

names(s)
s

s <- rbind(s,data.frame('name'='최길동','kor'=80,'mat'=90,'eng'=93))

t <- data.frame(name=c('강길동','박길동', '최길동'),
                kor=c(100,90, 92),
                mat = c(90,95,100))
t <- cbind(t,data.frame(sci=c(88,80,94)))
ncol(t)
t
t[-2,]
t[,-1]
s[,c(1,4,2,3)]

s;t

merge(s,t)
merge(s,t,all=T)
cbind(s,t)
cbind(t,s)

tt <- subset(t,select=c(name,kor,mat))
ss <- subset(s,select=c(name,kor,mat))
rbind(tt,ss)
rbind(ss,tt)