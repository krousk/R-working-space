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

#-------------------------------

mon <- as.numeric(gsub(',', '', pop19[,2]))
tue <- as.numeric(gsub(',', '', pop19[,3]))
wed <- as.numeric(gsub(',', '', pop19[,4]))
thu <- as.numeric(gsub(',', '', pop19[,5]))
fri <- as.numeric(gsub(',', '', pop19[,6]))
sat <- as.numeric(gsub(',', '', pop19[,7]))
sun <- as.numeric(gsub(',', '', pop19[,8]))
#-------------------------------------------------

week <- data.frame(mon,tue,wed,thu,fri)

weeked <- data.frame(sat,sun)



suw1<- sum(week[1,])
bsw1<- sum(week[2,])
dgw1<- sum(week[3,])
icw1<- sum(week[4,])
gjw1<- sum(week[5,])
djw1<- sum(week[6,])
usw1<- sum(week[7,])
ssw1<- sum(week[8,])



suw2<- sum(weeked[1,])
bsw2<- sum(weeked[2,])
dgw2<- sum(weeked[3,])
icw2<- sum(weeked[4,])
gjw2<- sum(weeked[5,])
djw2<- sum(weeked[6,])
usw2<- sum(weeked[7,])
ssw2<- sum(weeked[8,])



low<- data.frame(suw1, bsw1, dgw1, icw1, gjw1,djw1,usw1,ssw1)
loed <- data.frame(suw2, bsw2, dgw2, icw2, gjw2,djw2,usw2,ssw2)

지역 <- c(1,2,3,4,5,6,7,8)
주중 <- c(22094347, 5306090, 2501721, 3930314, 1093383, 1283493, 708128, 141489)
주말 <- c( 6461961, 1638432, 764370, 1130607, 295026, 370261, 195758, 35911)

last1 <- data.frame(지역,주중)
last2 <- data.frame(지역,주말)


#지역별 주중 이용객 수 총합
ggplot(last1, aes(x=지역, y=주중,fill=as.factor(지역)))+
    geom_bar(stat = 'identity')+
    scale_y_continuous(labels = scales::comma)+
    geom_text(aes(label=주중),
              size=5,
              position="stack")


#지역별 주말 이용객 수 총합
ggplot(last2, aes(x=지역, y=주말,fill=as.factor(지역)))+
    geom_bar(stat = 'identity')+
    scale_y_continuous(labels = scales::comma)+
    geom_text(aes(label=주말),
          size=5,
          position="stack")

#지역별 주중-주말 이용객 수 차이
차이<- (last1$주중)-(last2$주말)
지역

last3 <- data.frame(지역, 차이)

ggplot(last3, aes(x=지역, y=차이,fill=as.factor(지역)))+
    geom_bar(stat = 'identity')+
    scale_y_continuous(labels = scales::comma)+
    geom_text(aes(label=차이),
              size=5,
              position="stack")