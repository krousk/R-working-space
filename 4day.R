#
#4일차
#
# 0. open
# 1. review
# 2. topic
#  2.1 algorithm 이해  
#  2.2 선택구조
#  2.3 반복구조
#  2.4 함수
# 3. Q&A
# 4. next
# 5.

#1. Review
#
#변수명 / 표준입력 / 표준출력
#
#변수명 부여 방식 즉 이름 부여 방식. 본인의 룰을 정해라.
numberValue <- 1           # camel 표기법 시작은 소문자인데 중간에서 대문자
str_value <- "R Lanuguage" # snake 표기법 중간에 _사용. +헝가리안 표기법도 있음.
booleanvalue <- TRUE       # 일반 표기법 그냥 다 소문자. 단어부분이 명확하지 않은 단점이 있음.
#나중에 볼것을 고려해서 의미있는 이름을 부여할 것.

#표준 출력장치에 출력
#print(): 자동 줄바꿈(\n, 자동 개행)
numberValue; print(numberValue)
str_value; print(str_value)
booleanvalue; print(booleanvalue)

#cat()여러내용을 출력할 수 있고, 자동 줄바꿈이 일어나지 않는 표준 출력 장치에 출력하는 함수.
#
#제어문자: 화면에 출력되지 않고 기능을 수행하는 문자 cat에서만 써라,
# \n: 개행문자 (줄바꿈)
# \t: tab 문자
#
cat('Numeric number: ', numberValue, '\n')
cat('string: ',str_value, '\n')
cat('Boolean value: ', booleanvalue, '\n')
print('--------------------------------------------------')
cat('Numeric number: ', numberValue, '\t',
    'string: ', str_value, '\t',
    'Boolean value:', booleanvalue, '\n')
cat('test')

#표준 입력장치로 부터 입력
#cat():표준입력장치로부터 입력받은 함수
#readline():표준입력장치로부터 입력받는 함수
#edit():표준 입력장치로부터 표형식으로 입력받는 함수
#
#처음보는 함수라면 help를 통해 설명보기.

#출력(output,print) memory 내용을 output device에 전송.
#입력(input)

#표준 입력 장치로부터 입력
#
#scan():표준입력장치로부터 입력받는 함수
#readline():표준입력장치로부터 입력받는 함수
#edit():표준 입력장치로부터 표형식으로 입력받는 함수
#
inputData <- scan() #빈줄이 입력될때까지 숫자를 입력 받는다.
class(inputData)
inputData

inputData <- scan(what=character()) #문자 입력할 때는 반드시 이렇게 해야한다.
class(inputData)
inputData

inputData <- readline('Input data-> ')
class(inputData)
inputData


number1 <- readline('Input number1: ')
number2 <- readline('Input number2: ')
result <-as.numeric(number1)+as.numeric(number2) 
result

#
#실습문제: 두 수를 입력받아서 다음과 같이 출력 아니 슈벌 이걸 어떻게 하는 겨... 
#     입력 
#          Input number1:[10]
#          Input number2:[5]  
#   출력결과
#         10+5=15
#         10-5=5
#         10*5=50
#         10/5=2
#         10 %% 5=0
# 일종의 프로그래밍인 셈이다.


number1 <-as.numeric(readline('Input number1: ')) 
number2 <-as.numeric(readline('Input number2: '))

resultAdd <- number1+number2
resultSub <- number1-number2
resultMul <- number1*number2
resultDiv <- number1/number2
resultRem <- number1%%number2

cat(number1, '+', number2, '=', resultAdd, '\n',
    number1, '-', number2, '=', resultSub, '\n',
    number1, '*', number2, '=', resultMul, '\n',
    number1, '/', number2, '=', resultDiv, '\n',
    number1, '%%', number2, '=', resultRem,'\n')  #print는 한번에 여러개 어렵고, 매번 줄바꿈 해야해서.

#
#2.1 Algorithm 이해
#
#Algorithm(Logic): 문제를 해결하기 위한 일처리 순서.입력-계산-출력
#
#Algorithm 요건
# 1. 입력: 반드시 0개 이상의 입력이 있어야 한다. 없을 수도 있다는 것.
# 2. 출력: 반드시 1개 이상의 출력이 있어야 한다. 하지만 출력은 반드시 있어야 한다는 것.
# 3. 유한성: 반드시 끝낼 수 있어야 한다. 
# 4. 효과성: 효과적인 방법으로 정의되어야 한다. 현실적이어야 한다는 것이다.
# 5. 명확성: 명확한 방법으로 정의되어야 한다. 
# 
#컴퓨터 프로그램의 구조
#
#- 순차구조: 시작부터 끝날 때까지 차례대로 수행
#- 선택구조: 조건에 따라 처리 방향을 바꾸어서 수행
#- 반복구조: 조건이 만족하는 동안 동일한 내용을 반복 수행
#
#컴퓨터 프로그램은 알고리즘에 기반으로 기억장소 원리와 
# 순차/선택/반복구조를 조합하여 작성한다.
#

#
#2.2 선택구조
#
#선택구조 종류
#  1. 단순 선택 구조
#  2. 양자 택일 구조
#  3. 다중 선택 구조
#  4. 중첩 선택 구조
#
#1. 단순 선택 구조 주로 if 사용. 조건 결과는 참/거짓으로 나와야 함. {}는 코드블럭이라고 함.
job.type <- 'A'
bonus <- 0
if(job.type=='A'){  #code block(코드 집합) 이안의 것에 따라 처리.
    bonus <- 200
}
cat('job type: ', job.type, '\t\tbonus: ',bonus)

#2. 양자 택일 구조 else는 조건이 거짓일 때 수행.
job.type <- 'B'
bonus <- 0
if(job.type=='A'){  
    bonus <- 200
}else{
    bonus <- 100  #안 넣으면 0이니 없어도 문제없다면 안해도 되는데 누적이면 해야 함. 
}
cat('job type: ', job.type, '\t\tbonus: ',bonus)

#3. 다중 선택 구조 else if 반복되는 거 왜 그런지 알겠지? 이중에 하나 조건에 만족하는 게 있다면, 이라는 뜻. else는 거짓일때 인데, if라는 조건이 붙은 것. 조건 따져라, 라는 것.
score <- 50
if(score>=90){
    grade <- 'A'
}else if(score>=80){
    grade <- 'B'
}else if(score>=70){
    grade <- 'C'
}else if(score>=60){
    grade <- 'D'
}else {
    grade <- 'F'
}
cat('score: ', score,'\t\tgrade: ', grade)


#4. 중첩 선택 구조 가능하면 안 나오게 쓰는 게 좋다.
a <- 2; b <- 1; c <- 3
if(a>b){
    if(a>c){
       max <- a
       if(b>c){
           mid <- b; min <- c
       }else{
           mid <- c; min <- b
       }
    }else if(c>b){
        max <- c; mid <- a; min <- b
    }
}else if (b>c){
    max <- b
    if(a>c){
        mid <- a; min <- c
    }else{
        mid <- c; min <- a
    }
}
cat('max: ', max, '\timid: ',mid, '\tmin:', min)

number <- 10
remainder <- number%%2

if(remainder==0){
    oddeven <- '짝수'
}else{
    oddeven <- '홀수'
}
cat('number: ', number, '는', oddeven, '이다.')

#또는

number <- 10
remainder <- number%%2

#if (remainder==0){
if(remainder==0){
    oddeven <- '짝수'
}else{
    oddeven <- '홀수'
}
cat('number: ', number, '는', oddeven, '이다.')

#관계연산과 논리연산을 같이 쓴 것.
a <- 5  
b <- 20

if(a>5&b<5){
    cat(a, '> 5 and', b, '> 5')
}else{
    cat(a, '<= 5 or', b, '<= 5')
}

a <- 8; b <- 5; c <- 10; max <- a
if(b>max){
    max <- b
}
if(c>max){
    max <- c
}
cat('a = ',a, 'b = ', b, 'c = ', c, 'max = ', max)

#작은 값 출력 만약 최소값인 a와 비교해서 b가 더 작으면 최소값을 b로 바꾸고, ~반복. 
a <- 8; b <- 5; c <- 10; min <- a
if(b<min){
    min <- b
}
if(c<min){
    min <- c
}
cat('a = ',a, 'b = ', b, 'c = ', c, 'min = ', min)

#문제: 하나의 숫자를 입력받아 짝수인지 홀수인지 출력

x <- as.numeric(readline('input number: ')) #""아니엇지만 맞고.
if(x %% 2==0){                           #맞고
    cat(x, '는 짝수입니다.')                                #cat으로 행해야 하는데 실패. 이하 else 이해도 그렇고.
}else{
    cat(x, '는 홀수입니다.')
}


#문제: 하나의 숫자를 입력받아 3의 배수이면 "3의 배수", 5의 배수이면 "5의 배수", 3,5의 배수가 아니면 "3, 5의 배수가 아닙니다."로 출력

number <- as.numeric(readline('input number: ')) #일단은 다 맞음. 
if(number %% 3 ==0){
    cat(number, '3의 배수')
}else if(number %% 5 ==0){
    cat(number, '5의 배수')
}else{
    cat(number, '3,5의 배수가 아닙니다.')
}

#if문에 변수를 넣어도 된다.

#
#2.3 반복구조
#
# 반복구조: 조건이 만족하는 동안 동일한 내용을 반복수행
#
# 1. 반복 횟수가 정해진 경우: for
# 2. 반복 횟수가 정해지지 않은 경우: while
#
# for문: for([반복제어변수] in [반복범위]){}
# i가 반복 제어변수.
for(i in 1:10){
    print('*')
}

for(i in 1:10){
    cat(i,' ')  #'' 변수 내용. 
}

multiple = 2
for (i in 2:9){
    cat(multiple, ' * ', i, ' = ', multiple* i, '\n')
}

for (i in 2:9){            #중첩시킨 것.
    for(j in 1:9){
        multiple = i * j
        cat(multiple, '\t')
    }
} 


#
#반복 제어 변수 초기화
#while (반복 제어 변수 조건 검사) {
#  반복제어변수 값 변경
#}
#
i=1  #반복 제어 변수 초기화
while(i<=10){    #반복제어 변수 조건 검사, 참인 동안 반복
    print('*')
    i <- i+2   #반복 제어 변수값 변경, 누적(1씩 바뀌거나 2씩 바뀌거나.)
}

i <- 2
while (i<= 9) {
    j <- 1
    while (j <= 9) {
        multiple = i * j
        cat(multiple, '\t')
        j <- j + 1
    } 
    cat( '\n' )       #구구단 표로 안 나오면 이 줄바꿈 cat을 넣을 것. 
    i <- i + 1    
}



#
#2.4함수
#
#함수(function) : 단위기능을 수행하는 코드집합
#
#함수 종류
# 1. 내장함수: R에 미리 내장된 함수(기본함수)
# 2. 3rd party 함수: 제 3 자가 작성하여 배포한 함수
# 3. 사용자 정의 함수: 사용자가 직접 정의한 함수
#
#함수 형식
#
#함수 정의
#  함수 이름(명) <- function(인수 목록){
#       함수 내용에 해당하는 코드 집합
#       return(return값) 되돌릴 필요가 있을 때만.
#   }
#
# 함수 호출
#    함수명(인수목록)
#호출하는 것보다 정의하는 것이 먼저 나와야 함.
#

# 함수 정의
multiple(2)
multiple <- function(x){
    for(i in 1:9){
        multiple <- x * i
        cat(x, ' * ', i, ' = ', multiple, '\n' )
    }
}

multiple(2)

#return 값이 있는 함수
mymax <- function(x,y){
    num.max <- x
    if(y>num.max){
        num.max <- y
    }
    return(num.max)
}

mymax(5,6)

a <- 10; b <- 5; c <- 8
max <- mymax(a,b); max <- mymax(max,c)
max

#return 값이 여러개인 함수
myCalc <- function(x,y){
    add <- x + y
    sub <- x - y
    mul <- x * y
    div <- x / y
    rem <- x %% y
    
    return(list(ret.add=add, ret.sub=sub, ret.mul=mul, ret.div=div, ret.rem=rem))  #list 하나니 리턴도 하나인 셈. 안에는 많지만. 이렇게 하면 함수의 리턴 값을 여러개 적용하는 게 가능하다.
}                                                                                  # 여러개의 리턴을 내는 효과지만, 정상적이 방법은 아님
result <- myCalc(10, 5)
cat('10+5=', result$ret.add, '\n')
cat('10-5=', result$ret.sub, '\n')
cat('10*5=', result$ret.mul, '\n')
cat('10/5=', result$ret.div, '\n')
cat('10%%5=', result$ret.rem, '\n')

myCalc2 <- function(x,y){
    result <- c(x+y, x-y, x*y, x/y, x%%y)
    return(result)   
}                            

myCalc2(10,5)

# p77 86
# p46~88 까지 복습.