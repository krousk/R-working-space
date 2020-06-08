#
#6일차
#
# 0. open
# 1. review
# 2. topic
#  2-1. 다중변수 자료 탐색
#  2-2. 상관분석
#  2-3. 자료 탐색 실습(EDA)
# 3. Q & A
# 4. Next
# 5. close
#
#
#2.1 다중변수 자료 탐색=다변량. 상관관계 분석을 통해서 회귀 분석을 함.
#
#-다중변수(다변량)자료가 2개 이상인 자료
#-다중변수 자료는 2차원 형태, matrix나 data frame에 저장하여 분석
#-다중변수 자료에서 변수는 열(column),개별관측값들이 행(row)로 구성
#
#산점도(scatter plot) 2개의 변수로 구성된 자료의 분포를 알아보는 그래프. 관측값들의 분포를 2개의 변수 사이의 관계를 파악할 수 있는 기법.
#
#-산점도는 두 변수의 데이터 분포를 나타내는 것이기 때문에 두 개의 변수에 대한 자료가 필요.
#-산점도는 관측값들의 분포를 보면서 두 변수 사이의 관련성을 확인하는데 사용.
#즉 추세를 보겠다는 것.
#
str(mtcars)

#두 변수(이변량)에 대한 산점도
wt <- mtcars$wt  #중량과 연비와의 관계를 알아보려고 만든 것. 
wt
mpg <- mtcars$mpg
mpg


plot(wt, mpg,
     main = "중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=20)  #pch는 모양을 말함 별이나 원 세모 등등. help에서 확인 가능. 점 수는 관측치 수치만큼. 
                                                                                   #모르겠다면 help 찾는 것도 기술.
plot(mtcars$wt, mtcars$mpg, main = "중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=19)  # 따로 변수 안만들고 직접 변수지정.

plot(mtcars[ , c('wt','mpg')], main = "중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=18) # 요소지정.

plot(mpg~wt, data=mtcars, main = "중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=5)  #이 4가지 유형 중 하나를 골라서 쓰면 된다. 결과는 다 같으니까. 

#
#-pairs()는 여러 개의 변수에 대해 짝지어진 산점도 작성
#-다중 산점도는 대각선을 기준으로오른쪽 위의 산점도들과 왼쪽 아래의 산점도들이 대칭을 이룬다(동일한 산점도인데 x축과 y축이 바뀌어 있다.)
#-다중산점도는 여려변수들간의 추세를 한눈에 파악할 수 있다.


#2개 이상의 변수(다변량)에 대한 산점도
vars <- c("mpg", "disp", "drat","wt")
target <- mtcars[ , vars]
head(target)

pairs(target, main= "multi plots")

plots(target, main="multi plots")

#-두개의 변수에 대한 산점도를 작서할 때 그룹정보를 알고 있다면 작성 시 각 그룹별 관측값들에 대해 서로 다른 색과 점의 모양으로 표시할 수 있다.
# 두 변수간의 관계뿐만 아니라 그룹간의 관계도 파악할수 있다. 여러 함수에 대한 분석을 할때는 pairs, plot함수 사용.
#
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species)
point

color <- c("red", "green", "blue")

plot(iris.2, main="Iris plot", #그룹화되어있는 걸 활용할 때 사용 가능. 그 그룹간 관계 파악에 용이.
      pch=c( point ), 
      col = color[point])

#y=wx+b
#   x:기울기 b:절편
#회귀식(직선의 방정식)
# y는 변수(종속) x는 변수, 독립,

#
#2.2 상관분석
#
#-두 변수간의 관계를 분석 시, 추세의 모양이 선이 형태를 갖는 것을 선형적 관계라 표현한다. 서로 무슨 관계냐? 확인할 때. 영향을 주는가 안 주는가.
#
#-선형적 관계는 강한 선형적 관계가 있고,  약한 선형적 관계가 있다.
#
#-상관분석(correlation analysis): 얼마나 선형성을 보이는지 수칙상으로 나타내는 방법.
#
#-상관계수(corrlation coefficient)는 선형성의 정도를 나타내는 척도
#
#-상관계수 r의 성질
# -1<=r<=1
# r>0: 양의 상관계수(x가 증가하면 y도 증가)
# r<0: 음의 상관계수(x가 증가하면 y는 감소)
# r이 1이나 -1에 가까울수록 x, y의 상관성이 높다.
# 보통 0.5보다 크면 높다고 판단.
#-상관계수값이 1이나 -1에 가까울수록 관측값들의 분포가 직선에 가까워진다.

beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers,bal) #행/열?
tbl
#두 변수간의 관계성을 알아보자! 상관관계

plot(bal~beers, data = tbl)      #산점도로 시각화.
res <- lm(bal~beers,data = tbl)  #회귀식 도출 y=wx+b  x,y는 결정됬는데, w와 b는 아직. 이걸 결정해주는 게 lm. 즉 회귀식을 계산해주는 게 lm.
abline(res)                      #회귀선 그리기
cor(beers, bal)                  #상관 계수 계산. 0.5넘어서 상관관계 높다고 판단.

par(mfrow=c(1,2))
plot(wt~mpg, data = mtcars,
     main="중량-연비 그래프",
     xlab="중량",
     ylab="연비(MPG)",
     col="red",
     pch=19)
res=lm(wt~mpg, data = mtcars)
abline(res)

plot(drat~wt, data = mtcars,
     main="리어액슬기어비-중량 그래프",
     xlab="리어액실기어비",
     ylab="중량",
     col="red",
     pch=19)
res <- lm(drat~wt,data = mtcars)
abline(res)
par(mfrow=c(1,1))

cor(mtcars$wt, mtcars$mpg)
cor(mtcars$drat, mtcars$wt)

cor(iris[,1:4])

#
#시계열 자료(times series data) 시간의 변화에 따라 자료를 수집한 경우.
#
#선그래프: 다중변수 자료의 변수 중 하나가 연월일과 같이 시간을 나타내는 값을 갖는 경우 x축을 시간축으로 하여 시간의 변화에 따른 자료의 증강추이를 확인할 때 사용.
#
month <- 1:12
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,                        #x data
     late,                         #y data
     main = "지각생 통계",         #제목          
     type="o",                     #그래프 종류 l, b, s, o
     lty=1,                        #선의 종류
     lwd=1,                        #선의 굵기
     xlab="Month",                 #x축 레이블
     ylab="Late cnt")              #y축 레이블

month <- 1:12
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)

month <- 1:12
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,                        #x data
     late1,                         #y data
     main = "지각생 통계",         #제목          
     type="b",                     #그래프 종류 l, b, s, o
     lty=1,                        #선의 종류
     lwd=1,                        #선의 굵기
     col="red",
     ylim=c(1,15),                 #y축에 대한 상한/하한을 정해주는 것.
     xlab="Month",                 #x축 레이블 시계열 데이터, 시간 정보.
     ylab="Late cnt")              #y축 레이블
lines(month, late2, type = "b",col="blue")


#
#2.3
#
#Big data 분석과정
#1.문제정의
#2.Data 수집
#3.Data 전처리-여기까지 eda를 위한 사전작업
#4.탐색적 Data 분석(EDA)-검토하면서 이전 과정에서의 문제 지속수정. 최종결과물에도 들어가야함
#5.data 분석(data 모델 구축->ml/dl 머신러닝/딥러닝)
#6.결과
#시각화 필수.


#
#1. 분석대상 데이터셋 준비
#

#boston housing 데이터셋 활용
install.packages("mlbench")

library(mlbench)
data("BostonHousing")
myds <- BostonHousing[,c("crim", "rm", "dis", "tax","medv")]
myds
class(myds)
str(myds)
head(myds)
dim(myds)

#
#2.필요한 변수 추가-선택적으로 수행.
#
#crim: 지역 1인당 범죄율, rm: 주택 1가구당 방의 개수 
#dis: 보스턴 5개 직업 센터까지 거리
#tax: 재산세율, medv: 주택가격
grp <- c()
for(i in 1:nrow(myds)){
    if (myds$medv[i]>=25.0){
        grp[i] <- "H"
    }else if (myds$medv[i]<=17.0){
        grp[i] <- "L"
    }else{
        grp[i] <- "M"
    }
}
grp <- factor(grp)
grp <- factor(grp, levels = c("H","M","L"))

myds <- data.frame(myds,grp)

#
#3.데이터셋 형태와 기본적인 내용 파악
str(myds)
head(myds)
table(grp)

#
#4.히스토그램을 이용한 관측갑 분포 확인
#
par(mfrow=c(2,3))
for(i in 1:5){
    hist(myds[,i],main=colnames(myds)[i],
         col = "yellow")
}
par(mfrow=c(1,1)) #grp는 범주형이라 막대그래프로 그려야 하는 것. 도수분포.

#
#5. 상자 그래프에 의한 관측값 분포 확인 h, m, l 이 다 나와야 하는데 하나만 나온다. grp가 3개인게 문제같다.
#
par(mfrow=c(2,3))
for(i in 1:5){
    boxplot(myds[,i],main=colnames(myds)[i])
}
par(mfrow=c(1,1))

#
#6. 그룹별 관측값 분포 확인
#
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의개수")

#
#7.다중 산점도를 이용한 변수간 상과 관계 확인
#
pairs(myds[,-6]) #grp1,2 제외하면 맞음.

#
#8.그룹 정보를 포함한 변수 간 상관 관계 확인
#
point <- as.integer(myds$grp)
color <- c("red","green","blue")
pairs(myds[,-6],pch=point,
      col=color[point])

#
#9. 변수간 상관계수 확인
#
cor(myds[,-6])

#
#실습
#
library(rJava)
library(xlsx)
#원본 형식 그대로 해서 풀기.
setwd("C:\\R working space")
df.xlsx <- read.xlsx(file = "도로교통공단_시도_시군구별_월별_교통사고(2018).xlsx")


    