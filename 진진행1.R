#라면 끓이는 순서
#문제를 스스로 정의해야 함. 결론도출까지 된다면 결론도출까지. 할 수 있는 곳까지, 내가 생각한 범위까지. 
#문제 정의: 대형 해상 조난사고였던 타이타닉 호 생존자 분류를 통해서 구조 장비 추가 증설 시 최적 위치 찾기. 
#객실별 생존자 따져서 가장 적은 곳 
#동승객 비율 찾기.
#여객선 사고의 경우 사고 경우에 따라서 적재된 구조장비를 모두 활용하지 못하는 경우가 발생할 수 있다. 

setwd ("C:\\Rworkspace\\new-R-working-space")

ti <- read.csv(file="titanic_train.csv",
               header = T)
library(dplyr)
library(ggplot2)

ls(ti)
class(ti)
summary(ti)
str(ti)
head(ti)
tail(ti)


#전체 탑승 승객*완료
length(ti$name)
#*총 탑승자 수는 916명.*

#전체 승객 성별*완료 별로 중요하지는 않다. 그냥 보여주는 용도로. 
ggplot(ti, aes(x=sex))+
  geom_bar()+
  labs(x="성별",y="인원 수")+
  ggtitle("전체 승객 성별 현황")

pie(table(ti$sex))
#남성 581명, 여성 335명.
#남성이 여성에 비해 2배 정도 많은 수치.

#전체 탑승객 연령
ggplot(ti,aes(age))+
  geom_histogram(breaks=seq(0,75,by=1),
                 fill="blue")+
  ggtitle("탑승객 연령대")
#20~30세 사이에 주로 분포.

#전체 승객 사망/생존
td <-ti$survived
td1<- table(td)
pie(td1)
#사망: 563명 생존:353

#사망 관련.
#사망자 성별
ti.dead <- ti%>%
  group_by(survived)%>%
  filter(survived==0)

ggplot(ti.dead,aes(x=sex))+
  geom_bar()
#남성이 여성보다 4배 넘게 사망.

#사망자 객실
ti.d.c <- ti.dead%>%
  group_by(pclass)%>%
  filter(pclass==1)

summary(ti.dead)

#사망자 연령
ggplot(ti.dead,aes(age))+
  geom_histogram(breaks=seq(0,75,by=3),
                 fill="black")+
  ggtitle("연령별 사망자")
#20~40세 사이에서 사망자 다수 발생


#사망자 요금 대표값:12/평균 23, 
#연령 대표값:28, 평균 30 결측치 128.
#남성의 사망자 비율이 여성보다 4배 이상임을 알 수 있다.


#생존자 정보
ti.alive <- ti%>%
  group_by(survived)%>%
  filter(survived==1)

ggplot(ti.alive,aes(x=sex))+
  geom_bar()
#

summary(ti.alive)

#생존자 연령
ggplot(ti.alive,aes(age))+
  geom_histogram(breaks=seq(0,75,by=3),
                 fill="green")+
  ggtitle("연령별 생존자")


#생존자 요금 대표값: 26, 평균 46
#연령 대표값:29, 평균29.9
#생존자 비율에서는 여성이 남성보다 2배 이상의 수치를 기록했다.











#등급별 승객 수*완료
ti.pclass <- ti%>%
  group_by(pclass)

ti.pclass  
ggplot(ti.pclass, aes(x=pclass))+
  geom_bar()+
  labs(x="객실 등급", y="승객 수")+
  ggtitle("각 객실별 탐승객 수")


#등급별 사망/생존











#가족 승객 사망/생존

#승객 연령*if로 그룹별로.


#등급별 남녀승객
class1 <- subset(ti, ti$pclass==1)
class1
ggplot(class1, aes(x=sex))+
    geom_bar()
#숫자를 어떻게...

class2 <- subset(ti, ti$pclass==2)
class2
ggplot(class2, aes(x=sex))+
    geom_bar()

class3 <- subset(ti, ti$pclass==3)
class3
ggplot(class3, aes(x=sex))+
    geom_bar()







#등급별 남녀 승객 사망
class1.d <- subset(ti, ti$pclass==1)%>%
    subset(survived==0)