#
# 2일차 R Script 실습
#

# 1. 값을 이용한 계산
class(3)    #자료형 확인 함수
class(5)
3+5
print(3+5)    #출력 함수
#
#일반적인 출력장치를 표준출력 장치
#라고 하며, 장치 지정을 하지 않아도
#자동으로 사용되는 장치를 의미한다.
#
#stdout(표준 출력 장치) 미리 출력장치를 정해놓은 것. : 모니터
#stdin(표준 입력 장치) : 키보드
#stderr(표준 error 표시 장치) : 모니터
#

print(10+5)    #덧셈
print(10-5)    #뺄셈    
print(10*5)    #곱셈
print(10/5)    #나눗셈
print(10%%5)   #나머지
print(10^5)    #제곱

# 
#산술 연산 함수
#
log(10+5)          #로그 함수
sqrt(25)           #제곱근 함수
max(5,3,2)         #최대값 구하는 함수
min(5,3,2)         #최소값 구하는 함수
abs(-5)            #절대값 함수
factorial(5)       #팩토리얼 함수
sin(pi/2)          #삼각 함수
cos(pi/2)          #삼각 함수
tan(pi/2)          #삼각 함수

#변수 (variable)
# : 메모리 영역에서 대한 이름
# : 값을 저장하는 메모리 영역
# 
# 
number10<- 10
number2<- 8
print(number1+number2)
print(number1-number2)
print(number1*number2)
print(number1/number2)
print(number1%%number2)
print(number1^number2)


var1 <- 10
var2 <- 50
var3 <- 15*25
var4 <- var1/var2
print(var1)
print(var2)
print(var3)
print(var4)

var5=10*9
print(var5)


#
#자료형(Data Type)
#: 값에 대한 형태
#
number <- 10
string <- "R script"
boolean <- TRUE
temp <- NULL

#str(): 변수의 내용(type, 값)을 확인하는 함수.
class(number); str(number)
class(string); str(string)
class(boolean); str(boolean)
class(temp); str(temp)

missing <- NA     #NA: 결측치(missing value) 잘못된 값이라는 것. 전처리가 이런 결측치를 찾아내서 걸러내는 것.
chrnum <- '10'    #영숫자 문자니까 일공이라고 읽어야 함.

class(missing); str(missing)
class(chrnum); str(chrnum)

#
#Data Type 확인/변환
#
number <- 150
chanum <- '10'

class(number)
class(chanum)

#is로 시작하는 함수는 확인 함수: 결과 논리값
is.numeric(number)     
is.numeric(chanum)

is.character(number)
is.character(chanum)

# as로 시작하는 함수는 형 변환 함수
result <- number+as.numeric(chanum)
class(result); str(result)
print(result)



#
#vector(벡터): 동일 자료형 값의 자료 집합                   동일 자료형이라는 것이 중요.
#            : 1차원 배열, 열의 집합이라고도 한다.
#c(): connect의 약자로 벡터 생성 함수
#
vector <- c(1,3,5,7,9)
vector2 <- c('hello', 'world', 'R script')
vector3 <- c(TRUE, FALSE, TRUE, TRUE)

class(vector); class(vector2); class(vector3)
str(vector); str(vector2); class(vector3)
print(vector); print(vector2); print(vector3)

vector4 <- c(1,2,3,'4','5','6')
class(vector4)
str(vector4)
print(vector4)

#
# 연속값을 저장하는 벡터
#
vector5 <- 1:10
vector6 <- c(1,2,3,5:10)

print(vector5)
print(vector6)

vector_tc <- c(1,2,TRUE,FALSE)
class(vector_tc)
str(vector_tc)
vector_tc

vector7 <- seq(1,101,3)
vector8 <- seq(0.1, 1.0,0.1)
vector9 <- rep(1,times=5)
vector10 <- rep(1:5,times=3)
vector11 <- rep(c(1,5,9),times=3)

vector7
vector8
vector9
vector10
vector11

#
# 벡터 원소값에 이른 지정
#
score <- c(90,85,70)
score
names(score)
names(score) <- c('hong','kim','lee')  #names에 이름이 없어서 부여를 못해 null이 뜬 건데, 이번에 이름이 든 벡터 넣은것. 그래서 지정된것
names(score)
score

#
#벡터 길이
#
length(score)  #벡터에 요소개수가 얼마인지 궁금할때 쓰는 함수

#
#벡터 요소 읽기 #인덱스 번호를 넣거나, 이름이 있다면 이름을 넣으면 벡터가 나온다. 대체로 인덱스 많이 씀.
score[1]
score["kim"]
score[2]

#
#벡터 요소 쓰기
#
score
score[1] <- 55
score

score['lee'] <- 77
score

#
#벡터 요소 한 번에 여러개 읽기
#
v <- c(1,4,3,7,8)
v[c(1,3,5)]              #1,3,5번째 인덱스 값을 뽑아라.  
v[1:3]                   #1,2,3번째 인덱스 값을 뽑아라.
v[seq(1,5,2)]
v[-2]                    #2번째 인덱스의 값을 빼라
v[-c(3:5)]               #3,4,5 인데스 값을 빼라      원칙적으로는 한번에 하나이나, 벡터를 이용해 한번에 여러번도 가능.

v[c(1,3,5)] <- 5
v
v[-2] <- 100
v

#
#벡터간 연산
#
x <- c(1,2,3)    #x,y라는 벡터를 만든 것. c()가 있으니 벡터. 벡터간 연산은 두 벡터의 길이가 같아야 가능함.
y <- c(4,5,6)
x+y                   #벡터 합 계산
x*y                   #벡터 곱 계산
z <- x+y
z


#
#벡터에 적용가능한 함수
#
v <- c(1:10)

sum(v)                    #합계
sum(2*v)                  
mean(v)                   #평균 
mean(v[1:5])         
median(v)                 #중앙값 평균은 값의 분포에 따라서 왜곡이 생길 수 있으나 중앙값은 왜곡이 덜 하다.
median(v[1:5])
max(v)                    #최대값
min(v)                    #최소값
sort(v)                   #정렬 기본은 오름차순
sort(v,decreasing = FALSE)
sort(v,decreasing = TRUE)  #내림차순이 된 것.
range(v)                  #값의 범위(최소값~최대값)
var(v)                    #분산 값이 퍼진 정도.
sd(v)                     #표준편차 값이 모여있는 정도.

avg <- sum(v)/length(v)   #평균을 직접 구해본 것 굳이 이럴 필요는 없지만...
avg

#
#관계/논리연산  관계연산은 크기 비교, 논리연산은 그리고, 또는 부정 등.
#관계 연산자: >,>=,<,<=,==,!=
#논리 연산자: &&, &(AND), ||, |(OR), !(NOT)
#
number1 <- 10
number2 <- 19
number3 <- 3

#관계연산자 이용한 관계연산
number1>number2
number1<=number2

#관계/논리 연산자 이용한 논리연산
(number1>number2)&&(number1>number3)   #논리연산 : AND 둘다 참일때만 참.
(number1>number2)||(number1>number3)   #논리연산 : OR  둘다 거짓이 아니면 참.

#
#관계 연산자를 벡터에 적용
#
v <- 1:10
v>=5                #벡터의 요소요소마다 5보다 크거나 같아야 한다는 것.
v[v>5]
sum(v>5)          #거짓~참~ 이렇0000011111 이렇게 나옴. 참/거짓이 1, 0이니까. 인덱스 개수 아님!
v==5

condition <- v>5&v<8
condition
v[condition]
