setwd("C://Users//CPB06GameN//Desktop//과제=인원")
library(readxl)
library(rJava)
library(xlsx)
library(ggplot2)
library(tibble)
library(dplyr)
library(magrittr)


pop19 <- read.xlsx2(file = '총이용인원-요일별2019.xlsx', sheetIndex=1, startRow=6, header=T)
pop19
str(pop19)

pop19 <- pop19[2:9,]
str(pop19)




mon <- as.numeric(gsub(',', '', pop19[,2]))
tue <- as.numeric(gsub(',', '', pop19[,3]))
wed <- as.numeric(gsub(',', '', pop19[,4]))
thu <- as.numeric(gsub(',', '', pop19[,5]))
fri <- as.numeric(gsub(',', '', pop19[,6]))
sat <- as.numeric(gsub(',', '', pop19[,7]))
sun <- as.numeric(gsub(',', '', pop19[,8]))

#
mon<- data.frame(mon)
local<- c('서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시')
as.numeric(local)
mon<- cbind(mon,local)
mon <- data.frame(mon)
str(mon)
#



ggplot(mon, aes(x=reorder(local,-mon), y=mon))+
    geom_bar(stat = 'identity')

local <- c(1,2,3,4,5,6,7,8)             
week <- data.frame(mon,tue,wed,thu,fri,local)
str(week)
week<- week[,c(6,1,2,3,4,5)]

weeked <- data.frame(sat,sun)

wk19 <- data.frame(week,weeked)

#지역별 주중 합
y1 <- sum(week[2,])
y2 <- sum(week[3,])
y3 <- sum(week[4,])
y4 <- sum(week[5,])
y5 <- sum(week[6,])
y6 <- sum(week[7,])
y7 <- sum(week[8,])

wk<- data.frame(y1,y2,y3,y4,y5,y6,y7)
wk <- t(wk)
wk<- data.frame(wk)
str(wk)
ggplot(wk,aes(x=wk))+
    geom_bar()


ggplot(week,aes(x=))

#

pop19 <- data.frame(pop19k2,pop19k3,pop19k4,pop19k5,pop19k6,pop19k7,pop19k8)

rownames(pop19) <- c( '서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시')


pop19<- cbind(pop19, c( '서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시'))
pop19<- pop19[,c(8,1,2,3,4,5,6,7)]

colnames(pop19)=c('월','화','수','목','금','토','일')
str(pop19)

pop20<- t(pop19)
pop20 <- t(pop20)

pop20<- data.frame(pop20)
str(pop20)

ggplot(pop201, aes(y=월))+
    geom_histogram()
pop201 <- pop20

pop201<- cbind(pop201, c( '서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시'))
str(pop201)
data.frame(pop201)

mod(pop19$지역)



hist(pop19)

str(pop19)










-------
week.m<- (sum(pop19$월,pop19$화,pop19$수,pop19$목,pop19$금)/8)
week.md <- median(pop19$월,pop19$화,pop19$수,pop19$목,pop19$금)

weeke.m <- (sum(pop19))
week.md

pop19w <- cbind(pop19$지역, pop19$월,pop19$화,pop19$수,pop19$목,pop19$금) 
colnames(pop19w)=c('지역','월','화','수','목','금')
data.frame(pop19w)

str(pop19w)







hum <- read.xlsx2(file = '16-18총이용인원-요일별.xlsx', sheetIndex=1, startRow=6, header=T)
hum

dim(hum)
str(hum)
class(hum)
levels(hum)

head(hum)




hum16 <- hum[1:18,c(1:8)]
hum17 <- hum[1:18,c(1, 9:15)]
hum18 <- hum[1:18,c(1, 16:22)]

names(hum16)[1] <- "지역"; hum16
names(hum17)[1] <- "지역"; hum17
names(hum18)[1] <- "지역"; hum18

hum16 <- c(hum16[-1,])
hum16 <- data.frame(hum16)
hum16 <- hum16[1:8,c(1:8)]

hum17 <- c(hum17[-1,])
hum17 <- data.frame(hum17)
hum17 <- hum17[1:8,c(1:8)]

hum18 <- c(hum18[-1,])
hum18 <- data.frame(hum18)
hum18 <- hum18[1:8,c(1:8)]


str(hum16)

#------------------------------------------
#for i 함수로 49~55 항목 하나로 정리 가능, 이거로 나온 값을 벡터화해서 data.frame화 시키는 것도 가능.
hum16m <- hum16

hum16mk <- as.numeric(gsub(',', '', hum16m[,2]))
hum16mk2 <- as.numeric(gsub(',', '', hum16m[,3]))
hum16mk3 <- as.numeric(gsub(',', '', hum16m[,4]))
hum16mk4 <- as.numeric(gsub(',', '', hum16m[,5]))
hum16mk5 <- as.numeric(gsub(',', '', hum16m[,6]))
hum16mk6 <- as.numeric(gsub(',', '', hum16m[,7]))
hum16mk7 <- as.numeric(gsub(',', '', hum16m[,8]))

pop2016<- data.frame(hum16mk,hum16mk2,hum16mk3,hum16mk4,hum16mk5,hum16mk6,hum16mk7)
str(pop2016)

pop2016 <- cbind(pop2016, c('서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시'))
pop2016<- pop2016[,c(8,1,2,3,4,5,6,7)]

colnames(pop2016)=c('지역','월','화','수','목','금','토','일')


#----------------------------------------------------------------

#2016년 월요일
sum(pop2016$월)/8
median(pop2016$월)

sum(pop2016$화)/8
median(pop2016$화)

sum(pop2016$수)/8
median(pop2016$수)


#2016년 주중
sum(pop2016$월,pop2016$화,pop2016$수,pop2016$목,pop2016$금)


ggplot(pop2016,aes(x=지역))+
    geom_bar()

#
str(hum16m)
hum16m[1]
hum16m[2]


row
#-------------------------------------------
h16d <-data.frame(hum16m)


h16a<- rownames_to_column(hum16m, var="")

----------------------------------------------------------------------------------------------------------------


#-------------------------
#dj16 <- hum16[7,2:8]
#dj17 <- hum17[7,2:8]
#dj18 <- hum18[7,2:8]


dj16e<- gsub(",", "", dj16[1,])
str(dj16e)
dj16x <- as.numeric(dj16e)
dj16ex <- data.frame(dj16x)

str(dj16ex)

#전국 주요 이용 요일 수
#전국 지역별 이용객 상위 수 


#대전시의 3년간 요일별 이용객 수 변화


#전국의 3년간 요일별 이용객 수 변화


#이용객수 상위 5개 광역시 3년간 요일별 이용객 수 변화


#*as.intergear 안 먹힘. 