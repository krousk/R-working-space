#13일차

#다중선형 회귀분석(multiple linear regression analysis)

#다중선형 회귀모델: 여러개의 독립변수를 다루는 회귀모델. 어떤 결과에 영향을 미치는 요인이 하나이기보다는 여러 개인 경우가 
#                   대부분이기 때문에 다중선형 회귀분석(모델)에 대한 이해는 중요

#회귀식: y=w1X1+w2X2+...+wnXn+b

#독립변수가 n개인 다중선형 회귀에서 주어진 자료를 이용해
#w1,w2,..., wn,b의 값을 알아내는 회귀모델

#R에서 다중선형 회귀모델 생성에도 lm() 함수 사용

library(tidyverse)

install.packages("car")
library(car)

str(Prestige)
head(Prestige)
Prestige
#eudcation 교육연수(독립), income 연봉(종속), women 여성비율(독립), prestige 직군에 대한 평판(종속)

newdata <- Prestige[,c(1:4)]
head(newdata)
plot(newdata, pch=16, col='blue',
     main='Matrix Scatter plot')
c <- data.frame(Prestige$education,
                Prestige$income,
                  Prestige$women,
                  Prestige$prestige)
cor(c)

#다중선형 회귀모델 생성
model <-  lm(income ~ education + prestige +women , data=newdata)
model


#회귀모델의 결과를 이용한 회귀식
income=(-253.8)+(177.2*newdata$education+
                     141.4*newdata$prestige-
                     50.9*newdata$women)
income

#다중선형 회귀모델에 대한 값 확인
coef(model)                     #매개변수(계수) 값 확인-w값, b값
fitted(model)                   #훈련 집합에 있는 샘플에 대한 예측값   
residuals(model)                #잔차
deviance(model)                 #잔차 제곱합
deviance(model)/length(newdata$education) #평균제곱오차(MSE)

#생성된 다중선형 회귀모델에 대한 요약
summary(model)

#
#다중선형 회귀모델에서 변수 선택
# :종속변수를 설명하는데 도움이 되는 독립변수가 다수 존재한다.
# 그런데 모든 독립변수가 종속변수를 설명하는데 동일하게 기여하는 것은 아니다.
# 어떤 변수는 기여도가 높고 어떤 변수는 기여도가 낮다.
#
# 기여도가 낮거나 거의 없는 변수들은 모델에서 제외하는 것이 좋다.
# 적은 변수를 이용해 현실을 잘 설명할 수 있는 것이 좋은 모델이기 때문이다.
#
# R에서 모델에 기여하는 변수들을 선별할 수 있는 stepAIC() 함수 제공. 독립변수 기여도를 평가해보고 낮은 걸 알아서 빼는 함수. 모델 재구성.

newdata2 <- Prestige[,c(1:5)]
model2 <- lm(income~.,data = newdata2)
summary(model2)

library(MASS)

model3 <- stepAIC(model2)
model3

summary(model2)
#Multiple R-squared:  0.6436,	Adjusted R-squared:  0.6289 
summary(model3)
#Multiple R-squared:   0.64,	Adjusted R-squared:  0.6327 

#쓸데없는 변수를 제거해서 설명력이 더 올라감.

#linear regression ->예측이 목적. 예측결과가 실수로 나온다.(0~1 사이로 나옴. 즉 반올림한다는 것.)
#logistic regression -> 회귀를 이용한 분류(classification)

#2-2 로지스틱 회귀분석(logistic regression analysis)

# 회귀모델에서 종속 변수의 값의 형태가 범주형 값인 경우를 다루기 위해서 만들어진 통계적 모델
#
# 주어진 데이터로부터 어떤 범주를 예측하는 분야를 회귀와 구분하여 분류(classification)라 하고 분류 문제를 회구방법으로 해결하고자
# 개발된 회귀분석

#로지스틱 회귀도 기본적으로 회귀기법이기 때문에 종속변수는 숫자로 표현되어야 한다.

#예) YES와 NO는 0과 1로 변환.
#예) setoda, versicolor, verginica는 1,2,3 과 같이 숫자로 바꾼 후에 로지스틱 회귀 적용.

iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)
tail(iris.new)

#로지스틱 회귀모델 생성 선형모델과 다른 함수 사용, 
iris_model <- glm(Species~., data=iris.new)     #species가 종속변수, ~.은 나머지들이 독립변수가 된것을 뜻함.
iris_model

#매개변수 확인
coef(iris_model)

#로지스틱 회귀모델 요약 .이 붙은 것은 기여도가 낮다는 뜻.
summary(iris_model)

#로지스틱 회귀 모델을 통한 분류
unknown <- data.frame(rbind(c(5.1,3.5,1.4,0.2)))
names(unknown) <- names(iris)[1:4]
unknown

#Species=1.18649525 - (0.11190585*5.1) -
#                     (0.04007949*3.5) +
#                     (0.22864503*1.4) +
#                     (0.60925205*0.2)
#모델에서 구한 값을 직접 대입해서 식으로 만든 것. 이 식을 대신해서 해주는 함수가

t=1.18649525 - (0.11190585*5.1) -
                       (0.04007949*3.5) +
                       (0.22864503*1.4) +
                       (0.60925205*0.2)
t
#둘의 결과는 같음.
pred <- predict(iris_model, unknown)
pred

round(pred,0) #예측결과(소수 첫째 자리에서 반올림) 즉 정수만 취하겠다는 뜻.

#예측값에 대한 실제 품종 이름 알아보기
pred <- round(pred,0)
#levels() 펙터 타입의 자료에 대해 어떤 종류값인지 출력.
levels(iris$Species)[pred]


#linear regression은 대각선 직선으로 그래프 형성. 직선을 찾는 것. 연속형.

#logistic regression은 s자 그래프(sigmoid() 함수), 0~1 사이의 값이 나옴. 그래서 round로 예측값이 1인지 0인지 반올림해서 구분. 범주형.
#softmax() 여러 변수 중 가장 큰 값을 찾아내는 것. 

#다수 데이터에 대한 예측
test <- iris[,1:4]

pred <- predict(iris_model, test)
pred <- round(pred,0)
pred

#예측 정확도 확인
answer <- as.integer(iris$Species)
pred==answer
acc <- mean(pred==answer)
acc #정확도가 97.33%라는 거.10개 중 9개는 분류한다는 뜻.

#220~225는 설명. 264 로지스틱 회귀 283 차원축소 기법342 워드 클라우드 400
