#혼자 eda 해보는 것이 목적. 목적은 복습. 시간내로 맞춰서 하는 것.
#워드파일과 발표자료 내용이 달라야함.

#확실한 건 성별, 나이, 운임
#운임 요금이 없는 경우는 초대나 대납으로?

#1.구조장비를 추가로 배치해야한다면 어떻게 해야 하는가?
#2.객실별 생명보험요금을 산정할 때, 요금의 비율을 어떻게 해야하는가?

#1.해상 조난사고 시의 구조 우선순위 전통을 먼저 상기한다.
#1.전체 탑승객 성별 분류.
#1.객실별 성별 분류(총 3개)
#1.객실별 생존자 분류(총 3개)
#1.객실별 남여별 생존여부 분류(총 6개)
#1.비교 후 여성 생존자 여부를 기준으로 분류
#1.성인 연령 기준은 19세

#객실 등급별 희생자 숫자 파악
#연령별, 성별 동향 파악한 후 구조 우선순위와 비교.
#예를들어, 1등급 객실 여성 생존자-2등급 객실 여성 생존자-3등급 객실 여성생존자
#구조 우선순위 파악과 연결지어서 등급이 영향 미치는지 파악
#향후 구조장비 추가 배치시 우선시해야할 곳 선정.
#현대 여객선 톤수와 현황과 비교?

#그냥 데이터 막 뽑아서 하기.



setwd ("C:\\R working space")

ti <- read.csv(file="titanic_train.csv",
               header = T)
class(ti)

library(ggplot2)
library(dplyr)

#할 거.
#침착하게 처음부터 하자.
#이상치 확인 및 제거-일단 함
#시각화 그래프 만들기-진행중

#전체 탑승객



#전체 탑승객 성별 꾸미는 건 나중에. 파이는 되었는데 방법 까먹었다;;
ggplot(ti, aes(x=sex))+
    geom_bar()


#선실 등급실별 생존/사망
class1.live <- subset(ti, ti$pclass==1)
class1.live
hist(class1.live$survived, main = "1등급 선실 사망/생존")

ggplot(class1.live,aes(x=survived))+
    geom_bar()
###
class2.live <- subset(ti,ti$pclass==2)
class2.live
hist(class2.live$survived, main = "2등급 선실 사망/생존")

ggplot(class2.live,aes(x=survived))+
    geom_bar()
###
class3.live <- subset(ti,ti$pclass==3)
class3.live
hist(class3.live$survived, main = "3등급 선실 사망/생존")

ggplot(class3.live,aes(x=survived))+
    geom_bar()


#성별 생존/사망
sex.live.f <- subset(ti, ti$sex=="female")
sex.live.f

ggplot(sex.live.f,aes(x=survived))+
    geom_bar()

sex.live.m <- subset(ti, ti$sex=="male")
sex.live.m

ggplot(sex.live.m,aes(x=survived))+
    geom_bar()


#1등급선실 성별 생존자/사망자 
#1실 여성 생존 승객/1실 여성 전체 승객
#


#이상치 찾기-제거 완료.
boxplot(ti$pclass)$out
boxplot(ti$survived)$out
boxplot(ti$name)$out
boxplot(ti$sex)$out
boxplot(ti$age)$out
boxplot(ti$sibsp)$out
boxplot(ti$parch)$out
boxplot(ti$ticket)$out
boxplot(ti$fare)$out
boxplot(ti$cabin)$out
boxplot(ti$embarked)$out
boxplot(ti$body)$out
####

#body, age 이상치 제거
body.out <- boxplot(ti$body)$out
body.out
ti$body[ti$body %in% body.out] <- NA
head(ti)
newdata.body <- ti[complete.cases(ti),]
newdata.body

age.out <- boxplot(ti$age)$out
age.out
ti$age[ti$age %in% age.out] <- NA
head(age.out)
newdata.age <- ti[complete.cases(ti),]
newdata.age
#########

summary(ti)

#