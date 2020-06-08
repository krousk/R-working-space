# 시각화, 고급 기능 수행, 패키지. 이번 주 개인 프로젝트 하나 나옴. data set은 선정됨. 문제정의. 다음주 월요일에 발표. ppt로. 마지막 이론 수업 때 팀프로젝트.
#5일차
#
# 0. open
# 1. review
# 2. topic
#  2.1 text/exel 파일 읽기
#  2.2 자료의 종류
#  2.3 단일 변수 범주형 자료 탐색
#  2.4 단일 변수 연속형 자료 탐색
# 3. Q&A
# 4. NEXT
# 5. Close
# r은 대용량 처리에는 힘듬.
#
# 1. review
#
#분석절차
#1.문제 정의
#2.자료 수집
#3.자료 전처리 수집한 자료를 완벽한 형태로 변경, 수정하는 작업.
#*4.자료 탐색(EDA)* 자료를 이해하는 것.
#
#자바 관련. jdk는 java development kit, jre는 java runtime enviroment.의 약자.
#
# text file 읽기 setwd(directory 경로) 디렉토리 변경 함수 \ 쓸때는 반드시 두개를 써야 인식함. /는 한번만 해도 됨. 이 명령어는 다른 디렉토리에 있는 자료를 불러오는 명령어.
setwd("C:\\R working space") #파일 저장 경로 설정.
df.txt <- read.table(file = "airquality.txt", 
                 header = T,
                 encoding = "UTF-8")
df.txt

class(df.txt)
str(df.txt)
head(df.txt)
tail(df.txt)

#xml-extended markup language
#json-java script object notation 최근에는 제이슨 형식을 많이 쓰는데, 구조가 간결하기 때문.

#Excel 파일 읽기
#
#Excel 파일 읽기용 패키지 설치
install.packages("xlsx")   #exel 파일 읽기 패키지
install.packages("rJava")  #java 실행 패키지

# 기본 패키지 외에 설치된 패키지 사용 이건 매번 반드시 해야 한다. 즉 엑셀파일 읽으려면 이 두개의 라이브러리를 로드해야 한다는 뜻. 순서도 지켜야 한다. 
library(rJava)
library(xlsx)

df.xlsx <- read.xlsx(file = "airquality.xlsx",
                     sheetIndex = 1,
                     encoding = "UTF-8")
df.xlsx
class(df.xlsx)
str(df.xlsx)
head(df.xlsx)
tail(df.xlsx)

score <- c(76,89,49,59,60,74,52,69,77,98)
which(score==69)
which(score>=77)
max(score)
which.max(score) #최고값의 인덱스
min(score)
which.min(score) #최소값의 인덱스

idx <- which(score>=60)
score[idx] <-61
score



idx <- which(df.xlsx[,1:2]=="NA", arr.ind = TRUE)
                                  #arr.ind=true는 해당 조건의 행/열값을 확인할때.
idx #이건 좀 헷갈린다. 그냥 내가 원하는 값이 있는 인덱스 위치를 알 때 쓰는 거로 알자.


#2.2 자료의 종류
#
#-자료의 종류에 따라 적용할 수 있는 분석 방법이 다르다.
#-분석을 해야할 자료를 가지고 있을 때 1차적으로 해야할 일은
# 해당 자료가 어떤 분류에 속하는지를 파악하는 일이다.
#
#-자료 특성에 따른 분류
# 분석대상 자료의 특성에 따라 범주형 자료와 연속형 자료로 분류한다.
#
# 1. 범주형 자료(categorical data):                                대소비교에 의미가 없다. 즉 산술연산이 의미가 없다. 반면 연속형은 반대로 산술연산이 의미가 있음.그룹핑이 목적.
# -범주형 또는 그룹으로 구분할 수 있는 값.
# -범주형 자료의 값은 기본적으로 숫자로 표현할 수 없고,
# 대소 비교나 산술연산이 적용되지 않는다.
# -범주형 자료는 대체로 문자형 값을 갖는데, 숫자로 표기할 수 있으나 
# 계산이 가능한 연속형 자료가 되는 것은 아니다.
#
# 2. 연속형 자료(numerical data):
#-크기가 있는 숫자들로 구성된 자료.
#-연속형 자료의 값들은 대소비교, 산술연산이 가능하기 때문에 다양한 분석방법이 존재한다.
#
#자료(data): 어떤 주제를 가지고 값을 모아놓은 것 전체.
#관측값(observation): 자료에 포함된 값들. /행. 변수, 특성(feature),
#
#통계학에서의 변수는 "연구, 조사, 관찰하고 싶은 대상의 특성."
#
#변수 개수에 따라
# 1. 단일 변수 자료(univariate data), 일변량 자료, 하나의 변수로 구성된 자료.
# 2. 다중변수 자료(multivariate data), 다변량 자료, 두개 이상의 변수로 구성된 자료. 특별히 두개의 변수로 구성된 자료를 이변량 자료(bivariate data)
#
#단일 변수자료는 vector에 저장하여 분석
#다중 변수자료는 matrix 또는 data frame에 저장하여 분석
#
#변수의 개수와 자료의 특성에 따른 분류
#1. 단일변수 범주형 자료
#2. 단일변수 연속형 자료
#3. 다중변수 범주형 자료
#4. 다중변수 연속형 자료
# 
# *데이터 값이 같으면 매트릭스, 다르면 데이터 프레임. 벡터값이 다르면 list.
#

# 2.3 단일 변수 범주형 자료 탐색
#
#단일 변수 범주형 자료: 특성(변수)이 하나이면서 자료의 특성이 범주형인 자료. 성별, 혈액형 등. 여기서 하는 건 두개, 하나는 도수분포표로 만들기, 하나는 막대/파이 차트로 시각화.
# 범주형 자료에 할 수 있는 기본 작업: 자료에 포함된 관측값들의
#                                      종류별로 개수를 세는 것. 도수분포표
#                                      종류별로 비율을 구하는 것.
#                                   시각화는 막대/원 그래프를 사용.
#
#
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER','FALL', 'FALL', 'SUMMER', 'SPRING','SPRING')  #벡터 하나라는 건 변수가 하나라는 뜻. 머신러닝에서는 특성이라고 함. 일정하게 반복되는 범주형.
favorite
class(favorite) #type
str(favorite)   #내부구조
dim(favorite)   #data 수

#도수 분포표 작성
table(favorite)

# 도수 분포 비율. 정규화
table(favorite)/length(favorite)

#시각화(막대그래프)
ds <- table(favorite)
ds

class(ds)
str(ds)
dim(ds)

barplot(ds, main= 'favorite season')

ds.new <- ds[c(2,3,1,4)]  #내가 원하는 순서로 인덱스 번호 변경. 비중, 즉 점유율을 보고자 할 때.
ds.new
barplot(ds.new, main = 'favorite season')

pie(ds,main='favorite season')   #전체적인 비율을 보고자 할때.
pie(ds.new, main = 'favorite season')

favorite.color <- c(2,3,2,1,1,2,2,
                    1,3,2,1,3,2,1,2)          #범주형
ds <- table(favorite.color)  #그래서 도수분포표를 구한 것.
ds

barplot(ds, main = 'favorite season')

colors <- c('green', 'red','blue')
names(ds) <- colors;
ds
barplot(ds, main='favorite season',
        col = colors)
pie(ds, main = 'favorite season',
    col = colors)

#
#2.4 단일 변수 연속형 자료 탐색
#
#단일 변수 연속형 자료: 특성이 하나이면서 자료의 특성이 연속형인 자료. 연속형 자료는 관측값들이 크기를 가지므로 다양한 분석방법이 존재. 문제에 따라 달라지는 게 많아 범주형보다 까다로움.
#
#1. 평균(mean) 하나의 값으로 전체를 대표할 수 있는 값, 이상값에 영향을 받는다. 한쪽에 치우치는 값의 영향을 받을 수 있다라는 것.
#
#2. 중앙값(median) 자료의 값들을 크기순으로 정렬하였을 때 가장 중앙에 위치한 값, 이상값에 영향을 받지 않는다. 즉 어느정도 대표값으로 삼기 문제가 없다.
#
#3. 절사평균(trimmed mean) 자료의 관측값들 중에서 작은 값들의 하위 n%와 큰 값의 상위 n%를 제외하고 중간에 있는 나머지값들만 가지고 평균을 계산하는 방식. 다 해봐야 함.
#
#4. 사분위수(quatrile) 주어진 자료에 있는 값들을 크기순으로 나열했을 때 4등분하는 지점에 있는 값.
#   1사분위수(Q1), 2사분위수(Q2, 중앙값과 동일), 3사분위수(Q3)
#   전체 자료를 4개로 나누므로 4개 구간은 25%의 자료가 존재
#
#  -------------------------------------------------------------------------------------
#  |               |                   |                   |                           |
# 최소값         1사분위수         2사분위수            3사분위수                    최대값
#                 (25%)              (50%)                (75%)
#                   ----------------------------------------
#                                     중앙값
#주로 중앙값에 데이터가 밀집. 최소값과 최대값을 벗어나는 수치는 이상치로, 전처리에서 걸러내야 한다. 그러나 문제에 따라서 이상치 제거 유무를 확인해야하는 일도 생긴다.
#
#5. 산포(distribution) 주어진 자료에 있는 값들이 퍼져있는 정도.
#    분산(variance) 주어진 자료의 각각의 값이 평균으로부터 떨어져 있는 정도를 계산하여 합산한 후 값들의 개수로 나누어 계산
#   표준편차(standard deviation) 분산의 제곱근으로 계산
#   
# 시각화는 히스토그램(histogram)과 상자 그래프(box plot)를 사용.
# 
weight <- c(60, 62, 64, 65,68,69)
weight

weight.heavy <- c(weight, 120)  #이상치인 120 넣음.
weight.heavy

#평균
mean(weight)
mean(weight.heavy)

#중앙값
median(weight)
median(weight.heavy)

#절사평균
mean(weight, trim = 0.2)  #trim은 상하위 0.2 (20%) 잘라내고 계산한 값. 중앙값, 절사값이 평균과 큰 차이가 없다면 평균을 써도 된다. 즉 이 차이를 알아야 한다. 
mean(weight.heavy, trim = 0.2)

#사분위수
quantile(weight.heavy)
quantile(weight.heavy,(0:10)/10)
#(0:10)/10: 구간을 몇개로 나눌것인지를 지정.
#0.1~1.0 사이 백분율로 10%~100%
summary(weight.heavy) #median은 중앙값, 2사분위. 왜 120이 이상치인지는 시각화로 보면더 판단하기 쉽다. 

#산포
#분산
var(weight)

#표준편차
sd(weight)

#값의 범위(최소값과 최대값)
range(weight)

#최대값과 최소값의 차이
diff(range(weight))

#연속형 자료 시각화
#histogram: 연속형 자료의 분포를 시각화하는 도구. 연속형일때의 도수분포표.구간이라서 면적은 중요하지 않음. 구간의 빈도 수를 구할 때 사용.
#           연속형 자료에서의 구간을 나누고 구간에 속한 값들의 개수를 세는 방법으로 사용.
class(cars)
str(cars)

dist <- cars[,2]
dist
boxplot.stats(dist) #구체적인 값을 파악할 때 사용 
                    #$stats 사분위수
                    #$n 관측값의 수
                    #$conf 중앙값에 대한 신뢰구간
                    #$out 특이값(이상치)목록
hist(dist, main="histogram for 제동거리",
     xlab="제동거리",ylab="빈도수",
     border="blue", col="green",
     las=2, breaks=5)   #las는 출력방향. 1,2로 가로 세로 구분. breaks

#상자 그림(상자그림, boxplot, 상자 수염 그래프)
# 사분위수를 그래프형태로 시각화하는 도구
# 상자그래프는 하나의 그래프로 데이터의 분포
# 형태를 포함한 다양한 정보를 전달
# -자료의 전반적인 분포를 이해하는데 도움
# -구체적인 최소/최대/중앙값을 알기는 어렵다. 그래서 summary나, boxplot.state 같은 걸로 구체적인 수치를 알아야 한다. 그저 대략적인 이미지만 제공.
boxplot(dist, maint = '자동차 제동거리') #검게 나오는 선이 2사분위, 중앙값. 그 하단이 1사분위, 그 위가 3사분위. 중앙값 기준 3사분위쪽이 더 크니 그쪽에 더 많이 분포되어있다는 걸 알 수 있음.
                                         # 동그라미는 특이값, 하나 있으니 하나 있다는 것. 10개면 10개찍히거나 굵어짐. 이 그래프를 보고 분석을 어떻게 할 것인지를 결정. 
#이런 그래프를 구하는 것은 데이터를 이해하기 위함이다. 우리는 데이터 이해가 목적이다. 데이터의 이면을 찾기 위해.                                         

boxplot.stats(dist)
boxplot.stats(dist)$stats #정상범위 사분위수
boxplot.stats(dist)$n #관측치 수
boxplot.stats(dist)$conf #중앙값 신뢰구간
boxplot.stats(dist)$out #특이값(이상치) 목록 이상치는 sum으로 안나와서 이렇게 해야함.

# 일변량 연속형 데이터 중 그룹으로 구성된 자료의 상자그래프
boxplot(Petal.Length~Species, data = iris,
        main='품종별 꽃잎 길이')
str(iris)

boxplot(iris$Petal.Length~iris$Species,                      #그룹이면 그 그룹 정보가 반드시 뒤에 붙어야 함.
        main='품종별 꽃잎 길이')

#한 화면에 여러 그래프 작성                                               #팩터가 아니어도 들어간 내용이 그룹처럼 범주가 되었다면 펙터형.(??)
par(mfrow=c(1,3)) # 1x3 가상화면 분할 1행3열, 한 그래프(?)에 3개 그려라. 그룹이 나눠진건 아니니까 한 화면에 3개 넣고 비교할 수 있다는 것.
barplot(table(mtcars$carb), main='C',
        xlab='carburetors', ylab='freq',
        col='blue')
barplot(table(mtcars$cyl), main='Cyl',
        xlab = 'cyl', ylab = 'freq',
        col = 'red')
barplot(table(mtcars$gear), main='g',
        xlab = 'gear', ylab = 'freq',
        col = 'green')
par(mfow=c(1,1))                 #가상화면 분할 해제 1행3열에서 원래로 돌아가라.