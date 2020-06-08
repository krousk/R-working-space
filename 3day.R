




#
#vector
#

v <- 1:10

v>5
all(v>5)  # 벡터의 모든 요소가 조건에 만족하는가? 모든 요소가 5보다 커야 한다는 뜻. 그래서 이 두개가 t/f로 결정되는 것.
any(v>5)  # 벡터의 요소 중 조건에 만족하는 게 있는가? 하나라도 있으면 된다.

head(v)   # 처음부터 일정 개수(6개) default: 6개
tail(v)   # 끝에서부터 일정 개수(6개) default: 6개
head(v,3) # 처음부터 3개, 아래는 끝에서부터 3개
tail(v,3)

#
#집합(set): 중복 데이터가 없는 벡터
#

x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

union(x,y)     #합집합          p66의 내용. 집합은 중복 데이터를 허용하지 않는 벡터. 
intersect(x,y) #교집합
setdiff(x,y)   #차집합
setequal(x,y)  #동일한 요소가 있는가 확인

#
#2.1 List
#
#List: 동일 자료형, 다른 자료형을 저장할 수 있는 벡터. 벡터하고 같은 1차원. 
#
#list(): list 생성 함수. 요소는 key(이름)=value(값)형식이다.
v <- c(90,85,70,84)
l <- list(name='hong', age=30, status=TRUE, score=v)  #문자, 숫자, 논리, 벡터들이 모여있음, 그래서 이걸 리스트라고 부름.key(이름)=value(값) 여기에는 요소가 4개 있음. 벡터니 인덱스 사용가능

l

l[1]
l[4]

l[[1]]
l[[4]]
l[[4]][1] #하나만 쓰면 값의 이름까지 가져옴. 값만 가져오려면 2개 써야한다. 

l$name     # 안쓰지만 이름으로 접근하는 방법. P75,76에서 리스트에 관한 내용 나옴.
l$score

#
#2.2 factor(범주형, categorical)
#
#factor 형: 문자 형태로 저장되며 범위를 갖는 값을 저장. 범위가 있는 값. 저장하는 data type.
#
#factor(): 팩터형 벡터 생성함수
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')   #문자형 벡터
bt.factor <- factor(bt)                  #팩터형 벡터 

bt
bt.factor

gender <- c('남','여','여','남','남','여','여','남')  #factor 에서는 레벨즈가 항상 들어가고, 요 벡터 타입에서 항상 들어가는 종류를 보여줌. 해당 레벌 타입 아닌 것을 넣었을 경우 에러가 남. 그래서 편리.
gender.factor <- factor(gender) 

gender
gender.factor


bt[3] #3번째 인덱스값이 나온 것. 즉 요소값이
bt.factor[3]  #요소가 나오고 레벨즈도 함께 나옴. 그래서 불편함. 값 하나하나를 쓸때는 불편하지만, 종류가 여러개인 경우에는factor가 더 쉬움.

gender[5]
gender.factor[5]

levels(bt.factor)
levels(gender.factor)

as.integer(bt.factor) #얘는 왜 이렇게 나왔는가 하면 레벨즈의 순서로 나온 것. 즉 문자를 숫자로 치환하는데 레벨즈의 순서로 치환한 것. as, is는 2day에서 확인할 것. 펙터는 기본적으로 정수로 바꿈.
as.integer(gender.factor) #이 부분 좀 헷갈린다.

gender.factor[5]
gender.factor[5] <- '중'   #레벨즈에 속한 것이 아니라서 치환이 안됨.
gender.factor     #warning은 상황에 따라 무시 가능. error는 아님

#여기까지 벡터 정리 끝

#
#2.3 matrix
# 용어정리
#matrix(행렬, 2차원 배열) : 동일한 자료형의 데이터를 저장하는 벡터 집합
#
#row(행), =observation(관측값), 값(data)
#coium(열), =variable(변수)
#행과 열이 만나는 곳은 셀.   용어는 관측값, 변수, 셀
#
# matrix() : matrix 생성함수
#
z <- matrix(1:20,nrow=4)   # 1:20은 벡터.nrow=관측치 열을 먼저 채웠으니 열 우선. 매트릭스에 채워야하는 값, 매트릭스를 구성해야하는 행의 수. 열은 자동으로.
z
class(z) 
str(z)   #기억장소, 내용. int는 정수, []은 4행 5열 짜리라는 걸 알려주는 것.
dim(z)   # 행, 열. dimention, 차원을 뜻함. 즉 이 매트릭스는 변수가 5개다, 라는 뜻임. 단 2일차 변수와는 다름. 2일에서는 기억하는 값이라면, 여기서는 colum 열만을...??

z <- matrix(1:20, nrow = 4,ncol = 5, byrow = T)    #byrow라는 옵션으로 행,열우선 정할 수 있음. 보통 열 우선이나 t로 하면 행우선이 됨.
z

x <- 1:4    #두 벡터간 사이즈(length)가 같아야 경고가 안뜸
y <- 5:8
z <- matrix(1:20, nrow = 4, ncol=5)

m1 <- cbind(x,y)   #bind는 연결. 여기서는 x,y를 변수로 봄. 그래서 행이 4개, 변수가 2개. colum. 인수를 변수로 보고 매트릭스를 만든다.
m1
m2 <- rbind(x,y)   #여기서는 관측치로 봄. 그래서 행이 2개, 변수가 4개. row. 인수를 관측치로 보고 매트릭스 만든다.
m2
m3 <- rbind(m2,x) #m2에서 x라는관측치를 하나 더 준것.그래서 3행 4열이 된 것.
m3
m4 <- cbind(z,x) #4행 5열짜리에서 x를 변수를 추가로 하나 더 결합하라. 그래서 4행 6열이 된 것.
m4

#
# matrix에서 cell의 값 읽기
z[2,3]
z[1,4]
z[2,]  #2행 전체
z[,4]  #4열 전체

z[2,1:3]  #2행 1열 2열 3열
z[1,c(1,2,4)]  #1행 1열 2열 4열
z[1:2,]          #1행 2행 전체. 여기서부터 매트릭스. 행이 2개니까. 
z[,c(1,4)]       # 1열 4열 전체                 참고: 인덱스는 여러개 지정할 수 있고, 그럴 때 벡터를 넣는다.

#
#matrix 행/열에 이름 지정
#
score <- matrix(c(90, 85, 69,78,
                  85, 96, 49, 95,
                  90,80,70,70),
                nrow = 4, ncol = 3)
score

rownames(score) <- c('hong', 'kim', 'lee', 'yoo')  #행이름
colnames(score) <- c('english','math', 'science')  #열이름
score

score['hong', 'math']
score['kim', c('math', 'science')]  #이 결과는 벡터다.
score['lee',]
score[,'english']

rownames(score)
colnames(score)
colnames(score)[2] #colnames의 두번째 인덱스 값. 즉 이건 벡터형태라는 것.
#이렇게 안 풀고 풀어서 한다면.
c <- colnames(score)
c[2]


#
#2.4 data frame
#
#data frame: matrix와 동일한 구조를 갖으며 자료형에 구애받지 않고 저장하는 matrix
#
#data.frame(): data frame을 생성하는 함수
#
city <- c('seoul','busan','daejeon') #문자 벡터
rank <- c(1,2,3)                     #숫자 벡터
city.info <- data.frame(city, rank)  #변수의 데이터 타입이 다르다. 즉 변수의 자료형들이 다르다라는 말.
city.info

class(city.info)
str(city.info) #obs는 observation.
dim(city.info) #차원. 3행 2열 관측치 3개 변수2개. 매트릭스와 데이터 프레임은 형태가 같고, 데이터 프레임은 변수의 형태가 다를 수도 있다는 차이가 있다.

name <- c('hong','kim','lee')
age <- c(22,20,25)
gender <- factor(c('m','f','m'))
blood.type <- factor(c('a','o','b'))  #length가 다 같음. 변수들이. 그래서 관측치 3개에 변수 4개.

person.info <- data.frame(name,age,gender,blood.type)
person.info

str(person.info) #각각의 변수타입을 정확하게 알려줌. w/ n은 범쥬형의 갯수. 

#
#data frame 요소 읽기
#
city.info[1,1]
city.info[1,]
city.info[,1]
city.info[city.info$city=='seoul',]   #이름에 접근할때는 항상 $함.
city.info[,'rank']

person2.info <- data.frame(name=c('hong','kim','kim'),
                           age=c(22,20,25),
                           gender=factor(c('m','f','m')),
                           blood=factor(c('a','o','b')))
person2.info
                                        
person.info$name
person.info[person.info$name=='hong',]
person.info[person.info$name=='hong', c('name', 'age')]

data() #r이 제공하는 데이터 프레임 셋. help에서 해당하는데이터 프레임 셋에 대한 구조 설명함. 쓸때는 복사해서 써야함.

iris  #붓꽃 관련 데이터로 만든 것.
head(iris)
tail(iris)

class(iris)
str(iris)
dim(iris)
#타입을 파악해야 뭘 하고 뭘 할 수 없는지를 알 수 있음. 제일 먼저 str로 확인해야 한다. 

iris[,c(1:2)]   #HELP참고.   
iris[,c(1,3,5)]  #품종별로 50개
iris[,c('Sepal.Length','Species')] #꽃잎의 길이와 품종.
iris[1:5,]  #5개의 데이터(관측치)를 출력하라.
iris[1:5,c(1,3)]  #5개의 데이터 중 1, 3번 변수만 출력하라. # error 발생 확인 바람.


#
#matrix / dataframe 에서 사용하는 함수
#
class(state.x77)
class(iris)

dim(state.x77)
dim(iris)

str(state.x77)  
str(iris)

nrow(state.x77)
nrow(iris)

ncol(state.x77)
ncol(iris)

head(state.x77)  #행의 이력?? 디폴트로 6줄씩 나옴.
head(iris)

tail(state.x77)  #열의 이력?? 디폴트로 6줄씩 나옴.
tail(iris)

unique(iris[,5]) #중복을 배제하고 하나의 값만 나오게 하는 것. 이를 통해서 데이터가 3개라는 걸 알 수 있음. ㄱ이 50개, ㄴ이 50개, ㄷ이 50개인데 이는 데이터가 50개씩 중복된다는 소리임. 숫자 타임에서는 써서는 안됨. 값이 중복된다고 배제하면 안되니까.

table(iris[,5])   #도수분포표. 즉, 각각 몇개~ 라는 걸 보여주는 것. 그룹별로 카운팅.
table(person.info[,'blood.type'])  #팩터타입, 범주형이니까 그룹별로 묶는거 가능하니까 카운팅 사용가능.
table(person.info[,'gender'])

#
# matrix /data frame 산술연산함수
#
colSums(iris[,-5]); apply(iris[,1:4], 2,sum)  # 열별 합   2면 열, 1이면 행. 맨 sum 등은 행동하는?? 5번째 열은 문자라 합하거 할 수 없으니 빼는 것.
colMeans(iris[,-5]); apply(iris[,1:4],2,mean) # 열별 평균
rowSums(iris[,-5]);apply(iris[,-5],1,sum)     # 행별 합
rowMeans(iris[,-5]); apply(iris[,-5],1,mean)  # 행펼 평균
apply(iris[,-5],2,median)                     # 열별 중앙값    

sx <- state.x77  #이건 복사하는 것. 알에서 제공한 데이터 쓸거면 복사해서 쓸 것.
head(sx)
sx.t <- t(sx)   #행과 열의 방향 전환, 전치
head(sx.t)

#조건에 맞는 행과 열 추출(data frame만 가능) suset은 data frame만 가능. 기호 및 대소문자 주의.
subset(iris, Species=='setosa')
subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)

subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)[, c(2,4)]

#
#matrix/data frame 산술연산
#
m1 <- matrix(1:20,4,5)  #4행 5열. nrow ncol 생략한 것.
m1
m2 <- matrix(21:40,4,5)
m2

2*m1
m2-5
2*m1+3*m2
m1+m2
m2-m1
m2/m1
m1*m2

#
#matrix를 data frame으로, data frame을 matrix로 변환.
#
st <- data.frame(state.x77)
class(st)
str(st)
dim(st)

iris.m <- as.matrix(iris) #as는 변환함수
class(iris.m)
str(iris.m) #변환하면서 어쩔 수 없이 바뀐 것.
dim(iris.m)

#data type확인 함수
is.matrix(state.x77)
is.matrix(iris.m)
is.data.frame(st)
is.data.frame(iris)

#지난 2일간 배운 것 정리

#r의 데이터 타입
#숫자, 문자, 논리, factor, NULL, NA
#
#R에서 data 저장에 사용되는 요소
#변수
#1차원 배열
#-vector, list
#2차원 배열
#matrix, data frame


#
#2.5 파일 읽기/쓰기
#
#
#csv file 내용 읽어서 data frame 생성
#
air <- read.csv('C:\\R working space\\airquality.csv', header = T) #원래는 같은 디렉토리에 있으면 되는데 안되면 이렇게 주소 넣어서 만들기. header t,f는  첫줄을 열이름으로 할 거냐 
air2 <- read.csv('C:\\R working space\\airquality.csv', header = F) #csv는 comma seperator velue

class(air)
class(air2)

str(air)
str(air2)

dim(air)
dim(air2)

air
air2 #첫번째줄부터 데이터로 쓴 것. 그래서 header를 f 준 것. p59 참고.