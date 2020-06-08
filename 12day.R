#
#12일차
#

#차원축소 dimension reduction
#단순선형 회귀분석 simple linear regression

#차원의 저주 curse of dimensionality
# : 차원이 증가하면 그것을 표현하기 위한 데이터양이 기하급수적으로 증가하는 것을 의미
# : 고차원 데이터에서는 관측값도 기하급수적으로 증가하고 메모리 문제가 발생.
#
#차원 축소 dimension reduction
# : 데이터에서 불피요한 feature(특성, 변수)를 제거하는 작업
# : 데이터의 의미를 제대로 표현하는 특징을 추려내는 것.
# : 데이터 소실의 문제.
# : 이 위험성을 감수하더라도 유용하다면 실행.

#vector 1차원 배열
#vector 요소 데이터 과학에서는 차원이라는 용어 사용
#data frame 2차원 배열
#data frame의 열(배수)을 데이터 과학에서는 차원이라는 용어 사용. 

#차원축소 방법
#1. 주성분 분석(principal component analysis, pca)
# : 데이터의 분포를 가장 잘 표현하는 feature를 찾아주는 방법
# : 데이터의 분산(variance)를 최대한 보존하면서 서로 직교하는 축을 찾아 고차원 공간의 표본을 저 차원으로 변환하는 차원축소기법
#

#2.t-sne stochastic neighbor embedding
# : 단어 벡터와 같이 고차원 데이터를 시작화하는데 사용하는 차원 축소기법
# : 고차원 공간에 존재하는 데이터 x의 이웃간의 거리를 최대한 보존하는 저차원 y를 학습하는 방법

# 두개 이상의 변수에 대하여 산점도 표현->차원 축소가 필요
# r에서는 t-sne를 활용한 차원 축소 패키지 제고
install.packages("Rtsne")

library(Rtsne)
library(ggplot2)

ds <- iris[,-5]

dup <- which(duplicated(ds)) #중복 데이터 확인
dup #중복 데이터 위치값

ds <- ds[-dup,]
ds.y <- iris$Species[-dup] #중복 데이터 품종 제거

#차원 축소
#Rtsne(ds,              #차원축소 대상 data frame
#       dim=2,          #축소할 자원, 보통 2or3
#        perplexity=10) #차원축소하는 과정에서 데이터를 샘플링하는 샘플 수
#                         (대상 데이터 행의수)/3보다 작은 수
tsne <- Rtsne(ds, dim=2, perplexity=10)
tsne

#차원 축소 결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

ggplot(df.tsne,aes(x=X1, y=X2, color=ds.y))+
    geom_point(size=2)
#그래프 결과가 고정되지 않고, 실행할 때마다 달라질 수 있다. 매번 똑같이 차원 축소가 일어나는 것이 아니고, 정보손실이 발생하기 때문.

#
#4차원 데이터를 3차원 산점도로 작성
#
#3차원 산점도를 표현하기 위해 rgl, car 패키지 설치
install.packages(c("rgl", "car"))

library(car)
library(rgl) #3d 시각화 패키지
library(mgcv)

tsne <- Rtsne(ds, dim=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

#3차원 산점도
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

#회귀면이 없는 3차원 산점도
points <- as.integer(ds.y)
color <- c('red', 'green', 'blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          point.col = color[points],
          surface = FALSE)

scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          surface = FALSE)

#단순 선형 회귀분석(simple linear regerssion analysis)

#mqdel 현실 세계에서 일어나는 현상을 수학식으로 표현한 결과
#modeling 현실 세계에서 일어나는 현상을 수학식으로 표현하는 행위

#데이터 과학에서 modeling이란 수집한 데이터(훈련 데이터)를 이용하여 최적의 모델을 찾아가는 과정

#데이터 과학에서
# 독립변수(indepedent variable) 설명변수(explanatory variable)
# 특징(feature) -> x라 하고

#종속변수(dependent variable) 반응변수(response variable), 레이블(lable, 정답)->y라고 할때

#x가 입력되면 y를 맞추어야 하는 문제, y를 ground truth로 간주. x는 대문자, y는 소문자 주로 사용.




#회귀분석(regreesion analysis)
#회귀 이론을 기초로 독립변수x가 종속변수 y에 미치는 영향을 파악하여 예측모델을 도출하는 통계적인 방법

#예측모델을 도출할 때 회귀이론에 기초하기 때문에 모델이라 함.

#회귀모델에서는 독립변수와 종속변수 사이의 관계를 수학식의 형태로 표현하는데, 이를 회귀식(regression equation)이라 한다.

#회귀모델에서 독립변수는 x, 종속변수는 y로 표기
#회귀모델을 통하여  종속변수를 예측할 수 있는 모델이다.

#단순선형 회귀모델(simple linear regression analysis) 뭔가를 예측하는 모델. x 무조건 한개, x 한개로 y 하나 예측. 최적의 선을 찾는 것.
# : 독립변수 x와 종속변수 y 사이의 선형 관계를 파악하고 이를 예측하는 통계적 방법

#독립변수 x와 종속변수 y와의 관계를 선형으로 표현
#하나의 독립변수를 다루는 분석방법


#단순선형 회귀모델의 회귀식: y=Wx+b(w, b는 상수) '독립변수 x에 의한 종속변수 y의 값을 예측하는 것.' 
# x: 독립변수
# y: 종속변수
#오차가 최대한 작은 걸 찾는 것.
#
# wt(weight, 기울기), b(bias, 철편): x,y로 구성된 데이터를 이용하여 w,b를 찾는 모형
#
#최적의 단순선형 회귀모델을 찾는 과정
#
#*모델: y=Wx+b -> w,b를 계수(매개변수)*
#
#->수집된 데이터 x,y를 이용해 산점도 작성
#->회귀식은 산점도상에서 x,y의 추세를 나타내는 선에 대한 식
#->현재 수집된 데이터의 추세를 가장 많이 반영할 수 있는 w,b를 찾는 것이 단순선형회귀모델의 목표
#
#1. 모델선택->선형 방정식 선택
#2. 주어진 data(훈련 data)f를 적용하여 매개변수 결정.
#3. 예측은 훈련 데이터에 없는 새로운 데이터로 레이블을 추정하는 과정.
#4. 완성된 모델에 대한 품질 평가

#주행거리와 제동거리 사이의 회귀모델
str(cars)
head(cars)

#산점도를 통한 선형관계 확인
plot(dist~speed, data = cars)

#회귀모델 구하기
#종속(반응)변수~독립(설명)변수순으로 지정
model <- lm(dist~speed, cars)

#coefficients:
#    b에 해당          w에 해당
#   Intercept         speed
# -17.579             3.932
#
#dist=3.392xspeed-17.579

abline(model)

coef(model)   #매개변수(계수)-w, b값.
coef(model)[1] #b값
coef(model)[2] #w값

#주행속도에 따른 제동거리 구하기
b <- coef(model)[1]
w <- coef(model)[2]

speed <- 21.5
dist <- w*speed+b
dist


speed <- 30
dist <- w*speed+b
dist

speed <- 35
dist <- w*speed+b
dist

speed <- 40
dist <- w*speed+b
dist

#예측수행함수 통한 예측
df <- data.frame(speed=c(21.5,25.0,25.5,
                         26.0,26.5,27.5,
                         28.0))
predict(model,df)         #예측 수행함수

plot(df$speed, predict(model,df),
     col='red', cex=2, pch=20)
abline(model)

#예상 제동거리, 실제 제동거리, 오차
str(cars)
speed <- cars[,1]
pred <- w*speed+b
pred

compare <- data.frame(pred, cars[,2],
                      pred-cars[,2])
compare

colnames(compare) <- c('예상','실제','오차')
head(fitted(model),3)     #예측
head(residuals(model),3)   #추정된 값과의 차이
head(compare,3)

#machine learning ml, 기계학습.
#-지도학습-x,y가 모두 주어짐. 스팸메일, 챗봇 등.
#-비지도학습-x만 주어진다.
#-강화학습-경험학습.

fitted(model)    #훈련데이터에 있는샘플에 대한 예측값
residuals(model)  #잔차: 회귀식으로 추정된 값과의 차이
deviance(model)/length(cars$speed) #잔차 제곱합을 
                #평균 제곱 오차(MES, mean squared error)로 변환

#특정 조건 예측하는 모델 제작 가능. 변수를 찾아라, 최적화. 변수가 많을 때는 차원축소.

#귀무가설 null hypothesis 처음부터 버릴 것을 예상하는 가설
#대립가설 alternative hypothesis 귀무가설에 대립하는 명제. 모집단에서 독립변수와 종속변수 사이에 어떤 특정한 관련이 있다는꼴이다.

#예)범죄사건에서 용의자가 있을 때 형사는 이 용의자가 범죄를 저질렀다는 추청인 대립가설을 세우게 된다. 이때 귀무가설은 용의자는
#무죄라는 가설

#t-통계량(t-statistics) 또는 t값(t-value)
#: 데이터의 크기는 평균은 클수록, 분산은 작을수록, 데이터 크기가 클수록 믿음이 커진다에서 이 세가지 값을 묶은 것

#p값(p-value) 귀무가설을 가정했을 때,어떤 통계량이 관측 데이터와 같거나 클 확률.

#t값이 크면 대립가설에 대한 믿음이 강해지고, 귀무가설에 대한 믿음이 약해진다.
#t값이 작으면 대립가설에 대한 믿음은 약해지고, 귀무가설에 대한 믿음은 강해진다.

#데이터를 통해 '대립가설이 통계학적으로 유의미하다'라는 것을 증명하고 확인하는 작업을 t-검정(t-test)라고 한다.
#
#귀무사걸이 참이라고 가정했을 때, 표본으로부터 얻어지는통계치가 곧 나타날(관측될) '확률'을 계산하는데, 이때 계산된 확률값을
#p값이라고 함.
#p값이 매우 낮으면, 이러한 표본통계값은 우연히 나타나기 어려운 케이스 이기 때문에, 우리는 귀무가설을 채택하지 않고(기각하고)
#대안적인 가설인 대립가설을 채택한다.

summary(model)

str(women)
head(women)

model_w <- lm(weight~height, women)
model_w

summary(model)
summary(model_w)

