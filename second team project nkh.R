setwd("C://Users//CPB06GameN//Desktop//dataset")
old15<- read.csv(file = '지난_1년_동안_가장_많이_참여한_여가활동_유형_복수응답_15순위_20200601233920.csv')
               

library(readxl)
library(rJava)
library(xlsx)
library(ggplot2)
library(tibble)
library(dplyr)
library(magrittr)
library(readxl)

#지난 1년간 가장 많이 참여한 여가활동 유형 순위. 이거 18년도로 바꿔서 할 것.
#60, 70대만 따로 추출하여 데이터프레임화.

old1 <- data.frame(old15[10:11,])
#여기까지는 고정.

bo<- t(old1)
#방향을 바꾼 후

bo1 <- bo[3:11,1:2]
str(bo1)
#보다 더 세분화해서 범위 지정.

bo11 <- as.numeric(bo1[,1])
bo12 <- as.numeric(bo1[,2])
#문자로 인식되던 것을 숫자로 바꿈.

bo3<- data.frame(bo11,bo12)
bo3 <- bo3[-1,]
#표본 수로 인하여 그래프가 보기 어렵게 나오기에 표본 행 제거.

k<- c("휴식활동","취미오락활동",	"사회및 기타활동",	"스포츠참여활동","문화예술관람활동","스포츠관람활동","관광활동","문화예술참여활동")
k1<- as.factor(k)
str(k1)
#x축에 이름을 주기 위해 문자를 팩터로 지정.

barplot(bo3$bo11, ylim = c(0,100), names=k1, sub="60대")
barplot(bo3$bo12, ylim = c(0,100), names=k1, sub="70대")
#깔-끔.






#
#평일 희망하는 여가-휴식활동 우선순위
nl <- read.csv(file = '평일에_희망하는_여가활동_복수응답__휴식_활동_20200602143049.csv')

nl1 <- data.frame(nl[10:11,])
#여기까지는 고정.

no<- t(nl1)
#방향을 바꾼 후

no1 <- no[4:12,1:2]
str(no1)
#보다 더 세분화해서 범위 지정.

no11 <- as.numeric(no1[,1])
no12 <- as.numeric(no1[,2])
no3<- data.frame(no11,no12)
#문자로 인식되던 것을 숫자로 바꿈.

j<- c("산책 걷기","목욕/사우나/찜질방","낮잠","TV시청","비디오/DVD/VOD시청","라디오/팟캐스트청취","음악 감상","신문 잡지보기","아무것도 안하기")

j1<- as.factor(j)
str(j1)
#x축에 이름을 주기 위해 문자를 팩터로 지정.

barplot(no3$no11, ylim = c(0,100), names=j1, sub="60대")
barplot(no3$no12, ylim = c(0,100), names=j1, sub="70대")
#깔-끔.




#
#평일 희망하는 여가-취미오락활동 우선순위

hoi <- read.csv(file='평일에_희망하는_여가활동_복수응답__취미_오락_활동_20200602145521.csv')

hoi1 <- data.frame(hoi[10:11,])
#여기까지는 고정.

hof<- t(hoi1)
#방향을 바꾼 후

hof1 <- hof[4:24,1:2]
str(hof1)
#보다 더 세분화해서 범위 지정. 10은 60대, 11은 70대

ho1 <- as.numeric(hof1[,1])
ho2 <- as.numeric(hof1[,2])
ho3<- data.frame(ho1,ho2)
#문자로 인식되던 것을 숫자로 바꿈.

f<- c("수집활동","생활공예","요리하기/다도","반려동물 돌보기","노래방가기","인테리어","등산","낚시","홈페이지/블로그관리","인터넷검색/채팅/1인 미디어 제작/SNS","게임","보드게임퍼즐큐브 맞추기","바둑 장기 체스","겜블/복권구입","쇼핑/외식","음주","독서(웹소설 포함)","만화 보기","어학기술자격증취득공부학원","미용","이색/테마카페체험")

f1<- as.factor(f)
str(f1)
#x축에 이름을 주기 위해 문자를 팩터로 지정.

barplot(ho3$ho1, ylim = c(0,100), names=f1, sub="60대")
barplot(ho3$ho2, ylim = c(0,100), names=f1, sub="70대")
#깔-끔.

#######################################################

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
barplot(mr1, names=r1, ylim=c(0,100), sub="휴식활동 18년 60대")
barplot(mr2, names=r1, ylim=c(0,100), sub="휴식활동 18년 70대")

#
mmm1<- mr1*c(1,2,3,4,5,6,7)
mmm2<- mr2*c(1,2,3,4,5,6,7)
tmrt1<- sum(mmm1,na.rm=TRUE)
tmrt2<- sum(mmm2,na.rm=TRUE)
total.mul.r<- sum(tmrt1,tmrt2)

q1<- sum(mr1,mr2, na.rm = T)
#18년도 휴식활동에 대한 가중치 총점 na.rm으로 결측치 제거


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
barplot(hr1, names=h1, ylim=c(0,100), sub="취미오락활동 18년 60대")
barplot(hr2, names=h1, ylim=c(0,100), sub="취미오락활동 18년 70대")

#
hhh1<- hr1*c(1,2,3,4,5,6,7)
hhh2<- hr2*c(1,2,3,4,5,6,7)
thrt1<- sum(hhh1,na.rm=TRUE)
thrt2<- sum(hhh2,na.rm=TRUE)
total.mul.h<- sum(thrt1,thrt2)

q2 <- sum(hr1,hr2, na.rm = T)


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
barplot(tr1, names=t1, ylim=c(0,100), sub="관광활동 18년 60대")
barplot(tr2, names=t1, ylim=c(0,100), sub="관광활동 18년 70대")

#
ttt1<- tr1*c(1,2,3,4,5,6,7)
ttt2<- tr2*c(1,2,3,4,5,6,7)
ttrt1<- sum(ttt1,na.rm=TRUE)
ttrt2<- sum(ttt2,na.rm=TRUE)
total.mul.t<- sum(ttrt1,ttrt2)

q3<- sum(tr1,tr2, na.rm = T)

#####################################
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

barplot(da33$da11, ylim = c(0,100), names=a1, sub="문화예술관람활동 60대")
barplot(da33$da22, ylim = c(0,100), names=a1, sub="문화예술관람활동 70대")

#
ddd1<- da11*c(1,2,3,4,5,6,7)
ddd2<- da22*c(1,2,3,4,5,6,7)
tddd1<- sum(ddd1,na.rm=TRUE)
tddd2<- sum(ddd2,na.rm=TRUE)
total.mul.d<- sum(tddd1,tddd2)

q4<- sum(da11,da22, na.rm = T)

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
#이하 상단의 팩터가 반복이기에 따로 식 안 만들고 기존 것 재활용으로 처리하겠음.


barplot(db33$db11, ylim = c(0,100), names=b1, sub="문화예술참여활동 60대")
barplot(db33$db22, ylim = c(0,100), names=b1, sub="문화예술참여활동 70대")

#
bbb1<- db11*c(1,2,3,4,5,6,7)
bbb2<- db22*c(1,2,3,4,5,6,7)
tbbb1<- sum(bbb1,na.rm=TRUE)
tbbb2<- sum(bbb2,na.rm=TRUE)
total.mul.db<- sum(tbbb1,tbbb2)

q5<- sum(db11,db22, na.rm = T)


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


barplot(dc33$dc11, ylim = c(0,100), names=b1, sub="스포츠관람활동 60대")
barplot(dc33$dc22, ylim = c(0,100), names=b1, sub="스포츠관람활동 70대")

#
ccc1<- dc11*c(1,2,3,4,5,6,7)
ccc2<- dc22*c(1,2,3,4,5,6,7)
tccc1<- sum(ccc1,na.rm=TRUE)
tccc2<- sum(ccc2,na.rm=TRUE)
total.mul.dc<- sum(tccc1,tccc2)

q6<- sum(dc11,dc22, na.rm = T)

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

barplot(dx33$dx11, ylim = c(0,100), names=z1, sub="스포츠참여활동 60대")
barplot(dx33$dx22, ylim = c(0,100), names=z1, sub="스포츠참여활동 70대")

#
xxx1<- dx11*c(1,2,3,4,5,6,7)
xxx2<- dx22*c(1,2,3,4,5,6,7)
txxx1<- sum(xxx1,na.rm=TRUE)
txxx2<- sum(xxx2,na.rm=TRUE)
total.mul.dx<- sum(txxx1,txxx2)

q7<- sum(dx11,2, na.rm = T)


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

barplot(de33$de11, ylim = c(0,100), names=e1, sub="사회및기타참여활동 60대")
barplot(de33$de22, ylim = c(0,100), names=e1, sub="사회및기타참여활동 70대")

#
eee1<- de11*c(1,2,3,4,5,6,7)
eee2<- de22*c(1,2,3,4,5,6,7)
teee1<- sum(eee1,na.rm=TRUE)
teee2<- sum(eee2,na.rm=TRUE)
total.mul.de<- sum(teee1,teee2)


#값 비교

sof1<- c(total.mul.h, total.mul.r, total.mul.t, total.mul.d, total.mul.db, total.mul.dc, total.mul.de, total.mul.dx)
sof2 <- data.frame(sof1)
str(sof2)
class(sof2)
sof3 <- t(sof2)

sf <- c("취미오락활동", "휴식활동","관광활동","문화예술관람활동","문화예술참여활동","스포츠관람활동","사회및기타활동","스포츠참여활동")
sff <- as.factor(sf)

barplot(sof3, names=sff, y_axis_tick=seq(1000,1200,by=10), sub="가중치 적용 후 비교" )
######################


dsof3<- data.frame(sof3)
vvv <- t(dsof3)
vvv <- data.frame(vvv)
str(vvv)


plot(vvv$sof1, col=1:8,pch=16, axes=FALSE, ann=FALSE, cex=2) 
     axis(1,at=1:8,lab=sff )
     axis(2, ylim=c(1080,1180))
     
bv <- cbind(vvv, sff)    
