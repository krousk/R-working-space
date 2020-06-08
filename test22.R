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

setwd ("C:\\R working space")

ti <- read.csv(file="titanic_train.csv",
               header = T)
library(ggplot2)
library(dplyr)

ti
class(ti)
str(ti)
dim(ti)

table(ti)

head(ti)
tail(ti)

summary(ti)
#생존여부 성별
#생존여부 등급
#생존여부

gender <- c(ti$sex)
gender.factor <- factor(gender)
levels(gender.factor)


#파이차트로 나타낸 탑승객 성별 분류
gfb <- table(gender.factor)
pie(gfb,main="탑승객 성별 분류")


fe.sur <- filter(ti, pclass==1)
fe.sur.1 <- filter(fe.sur, sex=="female")
fe.sur.1