#7일차
#
#2.1데이터 전처리의 이해
#2.2결측치 처리
#2.3특이값 처리
#2.4데이터 가공



#
#2.1 데이터 전처리의 이해
#
#데이터 전처리(data preprocession)
# 초기에 확보한 데이터를 정제하고 가공해서 분석에 적합한 데이터를 확보하는 과정.
#
#데이터 전처리는 전체 분석과정 중에서 매우 오랜 시간을 차지하기 때문에 이를 효과적으로 처리하는 방법을 알고 적용하는 것이 중요.반드시 eda 전에.
#
#1. 문제정의
#2. 자료수집
#3. data 전처리. 어디까지 해야한다고 정해진 것은 없음. 정제하고 가공하는 모든 동작. 반드시 eda 전에. 안할 시 오류 발생 가능. 시간 다라 효율성 추구 필요.
#4. eda 그러나 전처리 하면서도 병행가능하기도 함. 하다가 전처리가 필요할 수도 있으니까.
#5. data 분석/modeing
#6. 보고서

# 데이터 전처리 내용
#1. 결측치 처리 -값이 없는 경우
#2. 특이값 처리 -값은 있으나 값이 문제에 맞지 않는 경우
#3. 데이터 가공 -원본 data에는 없는 내용을 추가, 변형. 합치는 것도 포함.

#2.2 결측값 처리
#
#결측치(결측값, missing value) 데이터를 수집하고 저장하는 과정에서 저장할 값을 얻지 못하는 경우 발생. R에서는 NA로 표기.
#
#결측치 종류. 주로 1, 2
# 1. 완전 무작위 결측(MCAR, missing completely at random) 
#    어떤 변수상에서 결측치가 관련된 또는 관련되지 않은 다른변수와 아무 연관이 없는 경우.
# 2. 무작위 결측(MAR, missing at random) 어떤 변수 상에 결측치가 관측된 다른 변수와 연관되어 있지만 
#    그 자체의 비관측된 값들과는 연관이 없는 경우.
# 3. 비 무작위 결측(NMAR, not misiing at random) 어떤 변수의 결측치가 완전 무작위 결측, 무작위 결측이 아니라면 비 무작위 결측에 해당. 
#    다소 애매.
#
#결측치 처리 방법
#1. 결측치를 제거하거나 제외한 다음 데이터를 분석한다. 관측치 자체를 삭제하며, 데이터 량의 축소를 불러오고 결과에 큰 영향.
#2. 결측치를 추정하여 적당한 값으로 치환한 후 데이터를 분석한다. 어떤 걸 대체할지에 대한 결정이 어려움.
#3. 시뮬레이션을 사용한 다중대체 방법. 실무에서 사용 많음.
#   다중대체(MI, Multiple imputation): 결측치에 대한 반복 시뮬레이션에 기반한 접근법.
#                                      복잡한 결측치 문제를 다루는데 사용하는 방법.
#

#벡터(vector)에 대한 결측치 처리
#
#R에서는 결측치를 NA로 표기.
#NA는 숫자형, 문자형, 논리형 값 어디에서나 결측치를 나타내는 용도로 사용.
#
#결측치 특성과 존재 여부 확인
z<-c(1,2,3,NA,5,NA,8)   
sum(z)                  
is.na(z)                   #na 여부확인 함수
sum(is.na(z))              #na 개수 확인
sum(z,na.rm = TRUE)        #na를 제외한 합계 계산. 공통함수.

#결측치 대체 및 제거
z1 <- c(1,2,3,NA,NA,8)
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z1)] <- 0          #na를 0으로 대체. 그러나 상황에 따라서 신중하게 결정.
z1
z3 <- as.vector(na.omit(z2)) #NA를 제거하고 새로운 vector를 생성. 
z3

#
# 매트릭스와 데이터 프레임 결측치 처리
#
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)

#데이터 프레임 결측치-변수, 열- 확인 즉 각 열별 결측치가 몇개인지 보여주는 것. 
#
#for문 이용. 변수 중심으로 변측치도 확인. *
for(i in 1:ncol(x)){
    this.na <- is.na(x[i])
    cat(colnames(x)[i],"\t",sum(this.na),"\n")
}

#appal() 이용
col_na <- function(y){
    return(sum(is.na(y)))
}

na.count <- apply(x,2,FUN = col_na) 
na.count

#데이터프레임 결측치 확인(관측치(행, row)dp 대한 설명 확인)
#
rowSums(is.na(x))                    #관측치별 NA 개수
sum(rowSums(is.na(x))>0)             #NA가 포함된 관측치 계수
sum(is.na(x))                        #dataset 전체에서의 NA의 개수 몇개 있는지는 알겠는데 무슨 변수인지는 모르겠다. 이 두개를 잘 조합해서 쓰기.


install.packages("mice")  #결측치 처리를 위해 사용하는 외부 패키지.
library(mice)

mean(is.na(x)) #결측치 비중, 즉 비율을 따진 것. 이 비중이 높다면 삭제를 고려할 것. 
mean(is.na(iris))

result <- md.pattern(x) #결측치 유형에 대한 표 작성.
result #첫번째 행은 정상 데이터가 147개라는 것. 결측치가 없는 관측치(data).더불어 유형을 나타냄. 
       #아래 3개는 관측치 유형. 맨 끝은 결측치가 없으면 0, 있으면 수에 따라 결측치 유형 숫자 표기. 그래프 참조.
#결과가 많아서 한눈에 보기 어려울 때
write.csv(result, "md_iris.csv", row.names = T) #폴더에 이 이름의 파일이 생김. 
md.pattern(iris) #결측치가 없는 유형. 

result.cor <- as.data.frame(abs(is.na(x)))
result.cor  #0 결측치가 아니다, 1은 결측치가 있다는 것.
result.cor.final <- result.cor[which(apply(result.cor,2,sum)>0)] #2는 열방향.>0는 결측치가 존재한다는 것. 즉 결측치가 존재하는 인덱스
cor(result.cor.final) #결측치 존재하는변수 3개인데, 이것들끼리의 상관계수가 가장 높은 게 누구냐? 그리고 그 변수를 삭제/바꿀거냐 고민해야함. 즉 어떻게 처리할 것인가에 대한 도움을 받을 수 있다.

result.cor.full <- cor(result.cor, result.cor.final, use = "pairwise.complete.obs")
result.cor.full    #http://bwlewis.github.io/covar/missing.html

#
#데이터 프레임의 결측치 제거
#
#complete.cases() dataset에서 NA를 포함하지 않은 완전한(complete)행을 찾는 함수.결측치가 없는 행을 찾아줌.
#
head(x)
x[!complete.cases(x),]  # !은 not. 그래서 결측치가 포함된 걸 보여줌.
y <- x[complete.cases(x),] #결측치가 없는 data set이 된 것.
head(y)

#
#결측치가 많은 dataset 인 경우 결측치가 포함된 관측치(행)를 모두 제거해버리면 
#실제로 남아있는 관측치(행)가 별로 없을 수 있으므로 분석이 어려운 경우가 생긴다.
#위와 같은 경우 만약 결측치가 특정 변수(열)에 모여있다면 해당 변수(열)만 제거한 후
#분석하는 것도 하나의 방법이다. 
#
#결측치가 여러 변수(열)에 흩어져 있는 경우에는 결측치를 적당한 값으로 추정하여
#대체한 후 분석할 수 있다.
#
#결측치를 추정값으로 대체하여 분석할 경우 분석의 신뢰도가 떨어질 수 있으나
#아무런 분석을 못하는 것 보다는 나은 방법이 될 수 있다.
#



#
#2.3 특이값 처리
#
#특이값(outlier, 이상치) 정상적이라고 생각되는 데이터의 분포 범위 밖에 위치하는 값들, 입력 오류나 실제 특이값일수도 있다.
#                        특이값의 성질은 제조공정의 불량품 선별, 은행거래 시스템의 사기 거래 탐지할 때에 사용하기도 한다.
#
#데이터 분석 시 특이값을 포함한 채 평균 등의 계산을 하면 전체 데이터 양상 파악에 왜곡을 가져올 수 있으므로 분석시
#제외하는 경우가 많다.
#
#dataset에 특이값이 포함되어 있는지 여부 조사 방법
#1. 논리적으로 있을 수 없는 값이 있는지 찾는다. 특별한 방법이 없기 때문에 분석자가 각 변수의 특성을 이해한 후 특이값 탐색. 논리적이라는 말이 애매함.업무나 업종에 익숙해야함.
#2. 상식을 벗어난 값이 있는지 찾는다. 나이가 -, 성적이 몇만점 등등.
#3. 상자그래프를 통해 찾는다. 
#

#
#특이값 찾기
#
#상자그래프글 이용한 특이값찾기
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

#특이값 처리-특이값 포함 관츠기(행) 제거
#
#일반적으로 특이값 포함 관측지(행)제거는 특이값을 NA로 바꾸고, NA를 포함한 행을 제거하는 방식으로 진행
#
#%in% 어떤 벡터에 비교하자고자 하는 값이 포함되어 있는지알고 싶을 때 사용.
#
#
out.val <- boxplot.stats(st$Income)$out  #특이값 검출
st$Income[st$Income %in% out.val] <- NA        #NA로 대체  
head(st)

newdata <- st[complete.cases(st),]    #NA 포함행 제거
head(newdata)                         #NA 이상치 있던 알래스카가 제거됨.

#
#2.4 데이터 가공
#
#데이터 가공(processing) 수집한 데이터에 대하어 분석을 용이하게 하기 위한 정렬, 집계, 병합 등과 관련한 작업
#
#1. 정렬(sort) 데이터를 주어진 기준에 따라 크기순으로 재배열하는 과정. 데이터 분석 시 빈번히 수행하는 과정
#              원본 데이터 순서가 바뀔 수 있으니 그러지 않도록 주의.
#
#order() 주어진 열의 값들에 대한 순서를 붙이는 함수. 
#        값의 크기를 기준으로 작은 값부터 시작해서 번호 부여.

v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1, decreasing = T)
v2

#매트릭스와 데이터 프레임 정렬
# :특정 열의 값을 기준으로 행들을 재배열하는 형태로 정렬
#
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] #실질적으로 정렬되는 효과.
iris[order(iris$Sepal.Length,decreasing = T),] #내림차순으로 인덱스 부여. 기준은 꽃받침의 길이. 만약 동일한 값이 있다면 기준 하나더. 마지막 스크립트.
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Sepal.Length,decreasing = T, iris$Petal.Length),] #맨앞은 원래 인덱스 값.

#
#2. 데이터 분리와 선택
#
#
#split() 하나의 dataset을 열의 값을 기준으로 여러 개의 dataset으로 분리. 즉 list 형식으로 결과를 주는 것이라고 생각할 것.
#subset() dataset으로 부터 조건에 맞는 행들을 추출.
#
#데이터 분리
sp <- split(iris, iris$Species) #품종별로 나누니 세 덩어리로 나뉜다.
sp
summary(sp) #사분위수 구할때 쓰던 summary. 여기서 분리가 된 변수들에게 쓸 경우, 어떻게 분리가 됬는지를 보여줌. 종류, 변수의 갯수 등.
sp$setosa 

#데이터 선택
subset(iris, Species=='setosa')
subset(iris, Sepal.Length>7.5)
subset(iris, Sepal.Length>5.1&Sepal.Width>3.9)
subset(iris, Sepal.Length>7.6,select = c(Petal.Length, Petal.Width)) #select는 해당 관측치에서의 해당 변수 내용만 가져옴. 즉 7.6이상인 것중에서의 pl, pw를 가져온 것.

#
#3. 데이터 샘플링과 조합
#
#데이터 샘플링(sampling) 통계용어,주어진 값들이 있을 때 그중에서 임의의 개수의 값들을 추출하는 작업
#
#비복원 추출: 한번 추출된 값은 다시 추출하지 않도록 하는 추출방식
#복원 추출: 추출한 값을 확인한 후 다시 데이터에 합친 후 새로 추출하는 방식
# *데이터 분석에서는 비복원 추출을 사용.
#
#샘플링이 필요한 경우는 dataset의 크기가 너무 커서 데이터 분석에 시간이 많이 걸릴 때 일부의 데이터만 샘플링하여 대략의 결과를
#미리 확인하고자 할 때 사용.
#
#숫자를 임의의로 추출
x <- 1:100
y <- sample(x, size = 10, replace = FALSE) #size 는 추출할 값, replace=false: 비복원 추출.
y

lr <- c("두리두리","고피자","집밥","마미하우스","코핫")
ld <- sample(lr, size = 1, replace = TRUE)
ld

#행의 임의의로 추출
idx <- sample(1:nrow(iris), size = 50, replace = FALSE)
idx.50 <- iris[idx,]
dim(idx.50)
head(idx.50)

sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)

set.seed(100)   #난수를 매번 쓸 것이냐, 아니면 동일한 난수를 불러올 것이냐. 이 함수를 쓰면 값이 매번 동일해짐.
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)

#
#4.데이터 조합(combination) 주어진 데이터값들 중에서 몇개씩 짝을 지어 추출하는 작업
#
#
# comb() 데이터 조합시 사용, 결과에서 *'각 열이 하나의 조합을 의미'
combn(1:5,3)
x=c("red","green","blue","black","white")
com <- combn(x,2)
com

for (i in 1:ncol(com)) {
    cat(com[,i],"\n")
}

#
#5.데이터 집계와 병합
#
# 데이터 집계(aggregation) : 매트릭스와 데이터 프레임과 같은 2차원 데이터는 데이터 그룹에 대해서 합계나 평균을 계산해야 하는
#                            경우가 많은데 이 작업을 의미한다.
#
#aggregate() 데이터 집계 함수   그룹단위 성격을 가진 자료를 한꺼번에 집계할 때 사용.
#               dataset      집계기준            집계작업내용  
agg <- aggregate(iris[,-5], by=list(iris$Species), mean)  #그룹단위로 집계할 때 사용. 이전에는 로직, subset으로 했는데 이건 한번에 가능.
agg                                                       #-5는...??? 뭐 빼라고 했는데.

agg <-  aggregate(iris[,-5], by=list(품종=iris$Species), mean)
agg

agg <-  aggregate(iris[,-5], by=list(표준편차=iris$Species), sd)
agg

#
#데이터 병합(merge) 데이터 분석을 위해 자료를 모으다 보면 연관된 정보가 여러 파일에 흩어져 있는 경우가 있는데, 
#                   이를 합치는 작업을 의미한다.
#
#
x <- data.frame(name=c('a','b','c'), math=c(90,80,40))
y <- data.frame(name=c('a','b','d'), korean=c(75,60,90))
x
y

#                병합기준
z <- merge(x,y,by=c('name')) #이름이 같은 것만 병합하라는 말.
z

z2 <- merge(x,y) #병합기준을 지정하지 않으면 같은 것만 병합됨.  
z2

merge(x,y,all.x=T) #x 데이터 기준으로 병합하겠다.즉 x에 있는 건 우선적으로 살려서 병합하겠다. y는 x와 같은 게 없다면 병합 안됨.
merge(x,y,all.y = F) #위와 반대.
merge(x,y,all=T) #전부 다 합쳐라.

#병합하는 기준이 되는 열의 이름이 다른 경우에 대한 병합
x <- data.frame(name=c('a','b','c'), math=c(90,80,40))    #둘 다 동일한 변수명은 없지만, 값이 같다.
y <- data.frame(sname=c('a','b','c'), korean=c(75,60,90))
x
y
merge(x,y,by.x = c('name'), by.y = c('sname'))   #by.x=내가 병합할 변수. 즉 x,y의 변수 이름이 달라도 내용이 같으면 병합하라.
#결측치 생기는 거 주의.

#교재:96 98 99 101 116~119 124 125 126 129 132 135 값을 일정한 범위로 내려서 맞추는 것. 단위가 일정해지니까 단위가 달라도 분석이 되는 것.
#데이터 전처리, 결측치, 이상치, 데이터 가공. 실질적으로는 고급 데이터 가공 패키지를 주로 쓰게 될 것. 시각화 도구도 고급 시각화 도구 사용.
#문자열 분석.