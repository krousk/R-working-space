setwd("C://Users//CPB06GameN//Desktop//dataset")

library(readxl)
library(rJava)
library(xlsx)
library(ggplot2)
library(tibble)
library(dplyr)
library(magrittr)
library(readxl)
library(devtools)
library(readr)

#
#휴식활동 만족도 18년도
mr <- read.csv('평일에_참여한_여가활동_만족도__휴식활동_관람_활동자_20200602182942(18년).csv')
mrt <-data.frame( mr[4:5,3:9])

nmrt <- t(mrt)

mr1 <- as.numeric(nmrt[,1])
mr2 <- as.numeric(nmrt[,2])

mr3 <- data.frame(mr1,mr2)
mr4 <- t(mr3)
r <- c("매우 불만족", "불만족","약간 불만족","보통","약간 만족함","만족함",	"매우 만족함")
r1 <- as.factor(r)

#
sg.mr <-data.frame(mr1,mr2, r1) 
tsg.mr<- data.frame(t(sg.mr [,c(3,1,2)]))
str(tsg.mr)

#1~2점, 매우 불만족, 불만족 합
tsg.mr1 <- as.numeric(tsg.mr$X1)
tsg.mr2 <- as.numeric(tsg.mr$X2)

smr1<- sum(tsg.mr1,tsg.mr2,na.rm = T)

smr1.d <- smr1/4
#값이 0.

#3~4점, 약간 불만족, 보통 합
tsg.mr3 <- as.numeric(tsg.mr$X3)
tsg.mr4 <- as.numeric(tsg.mr$X4)

smr2<- sum(tsg.mr3, tsg.mr4, na.rm =T)
smr2.d <- smr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.mr5 <- as.numeric(tsg.mr$X5)
tsg.mr6 <- as.numeric(tsg.mr$X6)

smr3<- sum(tsg.mr6,tsg.mr5, na.rm =T)
smr3.d <- smr3/4

#7점 이상, 매우 만족 합
tsg.mr7 <- as.numeric(tsg.mr$X7)

smr4<- sum(tsg.mr7, na.rm =T)

smr4.d <- smr4/2
#합한 값이 2개라서 2로 나눔.

mmm <- c(smr1.d, smr2.d, smr3.d, smr4.d)

#
#취미활동 만족도 18년도
hu <- read.csv('평일에_참여한_여가활동_만족도__취미오락활동_관람_활동자_20200602190651(18년).csv')
hut <-data.frame( hu[4:5,3:9])

nhut <- t(hut)

hr1 <- as.numeric(nhut[,1])
hr2 <- as.numeric(nhut[,2])

hr3 <- data.frame(hr1,hr2)
hr4 <- t(hr3)
h <- c("매우 불만족", "불만족","약간 불만족","보통","약간 만족함","만족함",	"매우 만족함")
h1 <- as.factor(h)

#
sg.hr <-data.frame(hr1,hr2, h1) 
tsg.hr<- data.frame(t(sg.hr [,c(3,1,2)]))
str(tsg.hr)

#1~2점, 매우 불만족, 불만족 합
tsg.hr1 <- as.numeric(tsg.hr$X1)
tsg.hr2 <- as.numeric(tsg.hr$X2)

shr1<- sum(tsg.hr1,tsg.hr2,na.rm = T)
shr1.d <- shr1/4
#

#3~4점, 약간 불만족, 보통 합
tsg.hr3 <- as.numeric(tsg.hr$X3)
tsg.hr4 <- as.numeric(tsg.hr$X4)

shr2<- sum(tsg.hr3, tsg.hr4, na.rm =T)
shr2.d <- shr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.hr5 <- as.numeric(tsg.hr$X5)
tsg.hr6 <- as.numeric(tsg.hr$X6)

shr3<- sum(tsg.hr6,tsg.hr5, na.rm =T)
shr3.d <- shr3/4

#7점 이상, 매우 만족 합
tsg.hr7 <- as.numeric(tsg.hr$X7)

shr4<- sum(tsg.hr7, na.rm =T)

shr4.d <- shr4/2
#합한 값이 2개라서 2로 나눔.

hhh <- c(shr1.d, shr2.d, shr3.d, shr4.d)
hhh





#관광활동 만족도 18년도
tu <- read.csv('평일에_참여한_여가활동_만족도__관광활동_관람_활동자_20200602192052(18년도).csv')
tut <- data.frame( tu[4:5,3:9])

ntut <- t(tut)

tr1 <- as.numeric(ntut[,1])
tr2 <- as.numeric(ntut[,2])

tr3 <- data.frame(tr1,tr2)
tr4 <- t(tr3)
t <- c("매우 불만족", "불만족","약간 불만족","보통","약간 만족함","만족함",	"매우 만족함")
t1 <- as.factor(t)

#
sg.tr <-data.frame(tr1,tr2, t1) 
tsg.tr<- data.frame(t(sg.tr [,c(3,1,2)]))
str(tsg.tr)

#1~2점, 매우 불만족, 불만족 합
tsg.tr1 <- as.numeric(tsg.tr$X1)
tsg.tr2 <- as.numeric(tsg.tr$X2)

str1<- sum(tsg.tr1,tsg.tr2,na.rm = T)
str1.d <- str1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.tr3 <- as.numeric(tsg.tr$X3)
tsg.tr4 <- as.numeric(tsg.tr$X4)

str2<- sum(tsg.tr3, tsg.tr4, na.rm =T)
str2.d <- str2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.tr5 <- as.numeric(tsg.tr$X5)
tsg.tr6 <- as.numeric(tsg.tr$X6)

shr3<- sum(tsg.tr6,tsg.tr5, na.rm =T)
str3.d <- shr3/4

#7점 이상, 매우 만족 합
tsg.tr7 <- as.numeric(tsg.tr$X7)

str4<- sum(tsg.tr7, na.rm =T)

str4.d <- str4/2
#합한 값이 2개라서 2로 나눔.

ttt <- c(str1.d, str2.d, str3.d, str4.d)



#문화예술 관람활동 만족도(18년도)
da <- read.xlsx2("18년도 예술관람활동 만족도.xlsx",sheetIndex = 1,header = T)
da

str(da)

da1 <- data.frame(da[7:8,])
da1

da2 <- t(da1)
da2

da3 <- da2[3:9, 1]
da3

da4 <- da2[3:9, 2]
da4

da11 <- as.numeric(da3)
da22 <- as.numeric(da4)

da33 <- data.frame(da11,da22)
da33

a <- c("매우 불만족","불만족","다소 불만족","보통","다소 만족한다","만족함","매우 만족함")
a1 <- as.factor(a)
str(a1)

#
sg.da <-data.frame(da11,da22, a1) 
tsg.da<- data.frame(t(sg.da [,c(3,1,2)]))
str(tsg.da)

#1~2점, 매우 불만족, 불만족 합
tsg.da1 <- as.numeric(tsg.da$X1)
tsg.da2 <- as.numeric(tsg.da$X2)

sdr1<- sum(tsg.da1,tsg.da2,na.rm = T)
sdr1.d <- sdr1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.da3 <- as.numeric(tsg.da$X3)
tsg.da4 <- as.numeric(tsg.da$X4)

sdr2<- sum(tsg.da3, tsg.da4, na.rm =T)
sdr2.d <- sdr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.da5 <- as.numeric(tsg.da$X5)
tsg.da6 <- as.numeric(tsg.da$X6)

sdr3<- sum(tsg.da6,tsg.da5, na.rm =T)
sdr3.d <- sdr3/4

#7점 이상, 매우 만족 합
tsg.da7 <- as.numeric(tsg.da$X7)

sdr4<- sum(tsg.da7, na.rm =T)

sdr4.d <- sdr4/2
#합한 값이 2개라서 2로 나눔.

ddd <- c(sdr1.d, sdr2.d, sdr3.d, sdr4.d)

#
#문화예술 참여활동 만족도(18년도)
db <- read.xlsx2("18년도 문화예술 참여활동 만족도.xlsx",sheetIndex = 1,header = T)
db

str(db)

db1 <- data.frame(db[7:8,])
db1

db2 <- t(db1)
db2

db3 <- db2[3:9, 1]
db3

db4 <- db2[3:9, 2]
db4

db11 <- as.numeric(db3)
db22 <- as.numeric(db4)

db33 <- data.frame(db11,db22)
db33

b <- c("매우 불만족","불만족","다소 불만족","보통","다소 만족한다","만족함","매우 만족함")
b1 <- as.factor(b)
str(b1)

#
sg.db <-data.frame(db11,db22, b1) 
tsg.db<- data.frame(t(sg.db [,c(3,1,2)]))
str(tsg.db)

#1~2점, 매우 불만족, 불만족 합
tsg.db1 <- as.numeric(tsg.db$X1)
tsg.db2 <- as.numeric(tsg.db$X2)

sbr1<- sum(tsg.db1,tsg.db2,na.rm = T)
sbr1.d <- sbr1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.db3 <- as.numeric(tsg.db$X3)
tsg.db4 <- as.numeric(tsg.db$X4)

sbr2<- sum(tsg.db3, tsg.db4, na.rm =T)
sbr2.d <- sbr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.db5 <- as.numeric(tsg.db$X5)
tsg.db6 <- as.numeric(tsg.db$X6)

sbr3<- sum(tsg.db6,tsg.db5, na.rm =T)
sbr3.d <- sbr3/4

#7점 이상, 매우 만족 합
tsg.db7 <- as.numeric(tsg.db$X7)

sbr4<- sum(tsg.db7, na.rm =T)

sbr4.d <- sbr4/2
#합한 값이 2개라서 2로 나눔.

bbb <- c(sbr1.d, sbr2.d, sbr3.d, sbr4.d)


#스포츠 관람활동 만족도(18년도)

dc <- read.xlsx2("18년도 스포츠 관람활동 만족도.xlsx",sheetIndex = 1,header = T)
dc

str(dc)

dc1 <- data.frame(dc[7:8,])
dc1

dc2 <- t(dc1)
dc2

dc3 <- dc2[3:9, 1]
dc3

dc4 <- dc2[3:9, 2]
dc4

dc11 <- as.numeric(dc3)
dc22 <- as.numeric(dc4)

dc33 <- data.frame(dc11,dc22)
dc33

f <- c("매우 불만족","불만족","다소 불만족","보통","다소 만족한다","만족함","매우 만족함")
f1 <- as.factor(f)
str(f1)


#
sg.dc <-data.frame(dc11,dc22, f1) 
tsg.dc<- data.frame(t(sg.dc [,c(3,1,2)]))
str(tsg.dc)

#1~2점, 매우 불만족, 불만족 합
tsg.dc1 <- as.numeric(tsg.dc$X1)
tsg.dc2 <- as.numeric(tsg.dc$X2)

scr1<- sum(tsg.dc1,tsg.dc2,na.rm = T)
scr1.d <- scr1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.dc3 <- as.numeric(tsg.dc$X3)
tsg.dc4 <- as.numeric(tsg.dc$X4)

scr2<- sum(tsg.dc3, tsg.dc4, na.rm =T)
scr2.d <- scr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.dc5 <- as.numeric(tsg.dc$X5)
tsg.dc6 <- as.numeric(tsg.dc$X6)

scr3<- sum(tsg.dc6,tsg.dc5, na.rm =T)
scr3.d <- scr3/4

#7점 이상, 매우 만족 합
tsg.dc7 <- as.numeric(tsg.dc$X7)

scr4<- sum(tsg.dc7, na.rm =T)

scr4.d <- scr4/2
#합한 값이 2개라서 2로 나눔.

ccc <- c(scr1.d, scr2.d, scr3.d, scr4.d)



#스포츠 참여활동 만족도(18년도)
dx <- read.xlsx2("18년도 스포츠 참여활동 만족도.xlsx",sheetIndex = 1,header = T)
dx

str(dx)

dx1 <- data.frame(dx[7:8,])
dx1

dx2 <- t(dx1)
dx2

dx3 <- dx2[3:9, 1]
dx3

dx4 <- dx2[3:9, 2]
dx4

dx11 <- as.numeric(dx3)
dx22 <- as.numeric(dx4)

dx33 <- data.frame(dx11,dx22)
dx33

z <- c("매우 불만족","불만족","다소 불만족","보통","다소 만족한다","만족함","매우 만족함")
z1 <- as.factor(z)
str(z1)


#
sg.dx <-data.frame(dx11,dx22, z1) 
tsg.dx<- data.frame(t(sg.dx [,c(3,1,2)]))
str(tsg.dx)

#1~2점, 매우 불만족, 불만족 합
tsg.dx1 <- as.numeric(tsg.dx$X1)
tsg.dx2 <- as.numeric(tsg.dx$X2)

sxr1<- sum(tsg.dx1,tsg.dx2,na.rm = T)
sxr1.d <- sxr1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.dx3 <- as.numeric(tsg.dx$X3)
tsg.dx4 <- as.numeric(tsg.dx$X4)

sxr2<- sum(tsg.dx3, tsg.dx4, na.rm =T)
sxr2.d <- sxr2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.dx5 <- as.numeric(tsg.dx$X5)
tsg.dx6 <- as.numeric(tsg.dx$X6)

sxr3<- sum(tsg.dx6,tsg.dx5, na.rm =T)
sxr3.d <- sxr3/4

#7점 이상, 매우 만족 합
tsg.dx7 <- as.numeric(tsg.dx$X7)

sxr4<- sum(tsg.dx7, na.rm =T)

sxr4.d <- sxr4/2
#합한 값이 2개라서 2로 나눔.

xxx <- c(sxr1.d, sxr2.d, sxr3.d, sxr4.d)


#사회 및 기타활동 만족도(18년도)
de <- read.xlsx2("18년도 사회 및 기타활동 만족도.xlsx",sheetIndex = 1,header = T)
de

str(de)

de1 <- data.frame(de[7:8,])
de1

de2 <- t(de1)
de2

de3 <- de2[3:9, 1]
de3

de4 <- de2[3:9, 2]
de4

de11 <- as.numeric(de3)
de22 <- as.numeric(de4)

de33 <- data.frame(de11,de22)
de33

e <- c("매우 불만족","불만족","다소 불만족","보통","다소 만족한다","만족함","매우 만족함")
e1 <- as.factor(e)
str(e1)

#
sg.de <-data.frame(de11,de22, e1) 
tsg.de<- data.frame(t(sg.de [,c(3,1,2)]))
str(tsg.de)

#1~2점, 매우 불만족, 불만족 합
tsg.de1 <- as.numeric(tsg.de$X1)
tsg.de2 <- as.numeric(tsg.de$X2)

ser1<- sum(tsg.de1,tsg.de2,na.rm = T)
ser1.d <- ser1/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#3~4점, 약간 불만족, 보통 합
tsg.de3 <- as.numeric(tsg.de$X3)
tsg.de4 <- as.numeric(tsg.de$X4)

ser2<- sum(tsg.de3, tsg.de4, na.rm =T)
ser2.d <- ser2/4
#평균 내기 위해 4로 나눔. 더한 값의 수가 4개니까.

#5~6점, 약간 만족, 만족 합 
tsg.de5 <- as.numeric(tsg.de$X5)
tsg.de6 <- as.numeric(tsg.de$X6)

ser3<- sum(tsg.de6,tsg.de5, na.rm =T)
ser3.d <- ser3/4

#7점 이상, 매우 만족 합
tsg.de7 <- as.numeric(tsg.de$X7)

ser4<- sum(tsg.de7, na.rm =T)

ser4.d <- ser4/2
#합한 값이 2개라서 2로 나눔.

eee <- c(ser1.d, ser2.d, ser3.d, ser4.d)



#값 비교

kkk<- data.frame(mmm, hhh, ttt, ddd, bbb, ccc, xxx, eee )
colnames(kkk) <- c("휴식활동", "취미활동", "관광활동", "문화예술관람활동", "문화예술참여활동", "스포츠관람활동", "스포츠참여활동", "사회및기타활동")

zzz<- c("grad1", "grad2", "grad3", "grad4")
kkk1
kkk1<- cbind(kkk, zzz)
kkk2 <- kkk1[,c(9,1,2,3,4,5,6,7,8)]
str(kkk2)
kkk3 <- cbind(kkk2,happy)
kkk4 <- kkk3[,c(10,1,2,3,4,5,6,7,8,9)]
kkk5<- kkk4[,-2]

attach(kkk5)
cor(happy, kkk5$휴식활동)
cor(happy, kkk5$취미활동)
cor(happy, kkk5$관광활동)
cor(happy, kkk5$문화예술관람활동)
cor(happy, kkk5$문화예술참여활동)
cor(happy, kkk5$스포츠관람활동)
cor(happy, kkk5$스포츠참여활동)
cor(happy, kkk5$사회및기타활동)

cor(happy, kkk5[,1:9])
pairs(kkk5[,1:9])

plot(휴식활동 ~ happy, data = kkk5)
abc1 <- lm(휴식활동~happy, data=kkk5)
abline(abc1)

plot(취미활동~happy, data=kkk5)
abc2 <- lm(취미활동~happy, data=kkk5)
abline(abc2)

plot(관광활동~happy, data=kkk5)
abc3 <- lm(관광활동~happy, data=kkk5)
abline(abc3)

plot(문화예술관람활동~happy, data=kkk5)
abc4 <- lm(문화예술관람활동~happy, data=kkk5)
abline(abc4)

plot(문화예술참여활동~happy, data=kkk5)
abc5 <- lm(문화예술참여활동~happy, data=kkk5)
abline(abc5)

plot(스포츠관람활동~happy, data=kkk5)
abc6 <- lm(스포츠관람활동~happy, data=kkk5)    
abline(abc6)

plot(스포츠참여활동~happy, data=kkk5)
abc7 <- lm(스포츠참여활동~happy, data=kkk5)
abline(abc7)

plot(사회및기타활동~happy, data=kkk5)
abc8 <- lm(취미활동~happy, data=kkk5)
abline(abc8)
##########################3

model <- lm(휴식활동~happy, kkk5)      #식 = 0.4065 X  + 4.3625 
model

model2 <- lm(취미활동~happy, kkk5)       #식 = 0.4553 X  + 3.3309
model2


model3 <- lm(관광활동~happy, kkk5)       #식 = 0.4692 X  + 3.252
model3

model4 <- lm(문화예술관람활동~happy, kkk5)       #식 = 0.4441 X  + 3.4226
model4

model5 <- lm(문화예술참여활동~happy, kkk5)      #식 = 0.436 X  + 3.912
model5

model6 <- lm(스포츠관람활동~happy, kkk5)      #식 = 0.2806X + 6.7549
model6

model7 <- lm(스포츠참여활동~happy, kkk5)      #식 = 0.3911 X  + 4.2484
model7

model8 <- lm(사회및기타활동~happy, kkk5)      #식 = 0.4889X  + 2.8704
model8

summary(model) # t = 1.213
summary(model2) # t = 1.338
summary(model3) # t = 1.582
summary(model4) # t = 1.204 
summary(model5) # t = 1.459
summary(model6) # t = 0.746
summary(model7) # t = 0.907
summary(model8) # t = 1.674



setwd("C://Users//CPB06GameN//Desktop//dataset")

tz <- read.csv('지난_1년_동안_가장_많이_참여한_여가활동_만족도_1순위_20200604155117.csv')
tz1 <- tz[4:5,2:10]

str(tz1)

tza<- tz1[,-2]
gg<- c("매우 불만족", "불만족","약간 불만족","보통","약간 만족함","만족함",	"매우 만족함")

tza1 <- as.numeric(tza[1,])
tza2 <- as.numeric(tza[2,])

tza3 <- data.frame(tza1, tza2)
tza4<- t(tza3)

gt1<- sum(tza4[,3])
gt2<- sum(tza4[,4])
gt3<- sum(tza4[,5])
gt4 <- sum(tza4[,6])
gt5 <- sum(tza4[,7])
gt6 <- sum(tza4[,8])

gt7 <- gt1*2+gt2*3+gt3*4+gt4*5+gt5*6+gt6*7
gt7

qa <- 0.4065*1118.2  + 4.3625
qb <- 0.4553*1142.2  + 3.3309
qc <- 0.4692*1151.5  + 3.252
qd <- 0.4441*1146.5  + 3.4226
qe <- 0.436*1136.2 + 3.912
qf <- 0.2806*1078.3 + 6.7549
qg <- 0.3911*1104.6  + 4.2484
qh <- 0.4889*1150.4  + 2.8704
qa
qb
qc
qd
qe
qf
qg
qh
qq <- c(qa,qb,qc,qd,qe,qf,qg,qh)
xa <- 0.4065*1111.3  + 4.3625
xb <- 0.4553*1111.3  + 3.3309
xc <- 0.4692*1111.3  + 3.252
xd <- 0.4441*1111.3  + 3.4226
xe <- 0.436*1111.3 + 3.912
xf <- 0.2806*1111.3 + 6.7549
xg <- 0.3911*1111.3  + 4.2484
xh <- 0.4889*1111.3  + 2.8704
xa
xb
xc
xd
xe
xf
xg
xh
xy <- c(xa,xb,xc,xd,xe,xf,xg,xh)


compare <- data.frame(qq,xy,qq-xy)
colnames(compare) <- c('실제','예상','오차')
compare

