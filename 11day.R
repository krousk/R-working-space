#
#11일차
#

#단계구분도
#텍트트마이닝(word cloud)
#조별 1차 프로젝트

#단계 구분도

#단계 구분도(choropleth map) 지역별 통계치를 색깔의 차이로 표현한 지도 시각화 도구
#
install.packages("ggiraphExtra") #단계 구분도 작성을 위한 패키지
install.packages("maps")         #R에 내장된 미국 주별 위/경도 데이터
install.packages("mapproj")      #위도(latitude)/경도(longitude) 표시

library(tibble) #dplyr 패키지 설치 자동 설치, 행을 변수로 변환 함수

library(ggiraphExtra)
library(maps)
library(mapproj)

library(ggplot2)

dim(USArrests)
str(USArrests)
head(USArrests)

# tibble 패키지 rownames_to_colum()를 이용하여 data(행)를 변수(열)로 변경

crime <- rownames_to_column(USArrests, var="state")  #행 이름을 하나의 변수로 만들겠다. 그 변수의 이름을 var=state로 지정.
crime$state <- tolower(crime$state) #위 과정으로 하나의 벡터가 생성됨. 그리고 이걸 하나의 변수로 추가하겠다.tolower

dim(crime)
str(crime)

#map 패키지의 미국 주별 위/경도를 나타내는 state 데이터를 ggplot2의 map_data()를 이용하여 data frame 생성
states_map <- map_data('state') #지도를 불러오기 위해서 필요함.
str(states_map)



#단계 구분도 작성
ggChoropleth(data = crime,
             aes(fill=Murder,
                 map_id=state),
             map=states_map,
             interactive = T)

#ggChoropleth(data= crime,)#지도에 표시할 데이터
#             aes(fill=Murder,  색깔로 표현할 변수
#             map_id=state),     지역 지준 변수
#             map=states_map,    지도 데이터
#             interactive=T)      지도에 커서를 갖다대면 정보가 표시됨.        


#https://github.com/cardiomoon/kormaps2014 들어가서 압축파일로 다운로드.

#대한민국 지도 데이터를 이용한 단계 구분도
install.packages("devtools") #r용 패키지 개발용 함수 모음

#r 공식 저장소(cran)에 없는 경우 원하는 패키지 설치 방법. 웹에서 압축파일로 안 받고 다운 가능.
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
library(dplyr)

#kormaps2014 지도 데이터
#kormap1 한국 행정 지도(시도별)
#kormap2 한국 행정 지도(시군구별)
#kormap3 한국 행정 지도(읍면동별)
#
#kormaps2014 내장 dataset
#korpop1 2015년 인구 센서스 데이터(시도별)
#korpop2 2015년 인구 센서스 데이터(시군구별)
#korpop3 2015년 인구 센서스 데이터(읍면동별)

#changeCode() 인코딩을 cp949로 변환, 원래 korpop1에 utf-8로 인코딩 되어 있으나, 윈도우에서는 한글 깨짐 발생.,
str(changeCode(korpop1))

#한글 변수명 변경
korpop1 <- korpop1%>%
    rename(pop=총인구_명,
           name=행정구역별_읍면동)

str(changeCode(kormap1))

korpop1$name <- iconv(korpop1$name, "UTF-8", "CP949") #iconv가 한글 깨짐을 바꿔주는 것. cp949로 인코딩하면 한글 왠만해선 안깨짐.
ggChoropleth(data = korpop1,
             aes(fill=pop,
                 map_id=code,
                 tooltip=name),
             map=kormap1,
             interactive = T)

ggChoropleth(korpop2,kormap2, fillvar="남자_명") #이건 moonbook2라는 패키지를 깔아야 사용 가능함.

#
#텍스트 마이닝 word cloud
#
install.packages("memorise") #에러를 보기 위해 설치.
install.packages("KoNLP")

#KoNLP korean neturial language processing 한글 자연어 처리
#공식 저장소에서 삭제되어서 직접 설치가 어려움.

install.packages("multilinguer")
library(multilinguer)
install_jdk()

#KoNLP 패키지 설치
install.packages("remotes")
remotes::install_github("haven-jeon/KoNLP",upgrade = "never",
                        INSTALL_opts=c("--no-multiarch"))
#방법2
devtools::install_github('haven-jeon/KoNLP')

#이렇게 해도 안되면 압축파일로 다운 받은 다음 R 라이브러리 폴더로 넣을 것. 이 이상 답이 없으면 와이파이 바꿔서 다시 해야함.
#이름도 바꿀 것. 설치 후에 뭐 입력하라고 하는데, 3번, 1번 순으로 누를 것.
library(KoNLP) #r용 한글 자연어 처리 패키지
useNIDic()     #사용자 사전 설정.

#
#data mining 대규모로 저장된 데이터(기업에 저장된 규모 정도) 안에서 체계적이고 자동적으로 통계적 규칙이나 패턴을 찾아내는 것을 말하며, 
#kdd(knowledg-discovery in databases, 데이터 베이스 속의 지식의 발견)
#

#text mining 비정형 데이터 마이닝의 유형중 하나. 비정형/반정형 데이터에 대하여 자연어 처리 기술과 문서처리 기술을 적용하여
#            유용한 정보를 추출, 가공하는 목적으로 하는 기술. 즉 음성이나 이미지를 텍스트로 바꾸는 것. 태블릿으로 서류서명처리하는 것도 이 기술.

#word cloud 텍스트 데이터를 분석하는 대표기술. 대상 데이터에서 단어(주로 명사)를 추출하고 단어들의 출현 빈도수를 계산하여
#(bow,       시각화하는 도구. 출현 빈도수가 높은 단어는 그만큼 중요하거나 관심도가 높다는 것을 의미.
#Bag of word, 단어지갑.) word cloud에서는 단어의 출현 빈도수가 높을수록 큰 글씨로 표현.

#영어는 공백으로 단어를 구분하지만, 한글은 조사 때문에 어려움. 그래서 형태소 분석을 함. 내가 원하는 걸로 잘라내는 기술.
#이 형태소 분석을 제공하는 기술이 KoNLP. 
#조사 등을 불용어(stop word)라고 함. 즉 의미가 없는 단어들. 등록을 해야 의미가 부여됨.
#그래서 KoNLP에서는 사용자 사전이 있음.
#

#테이블 함수로 카운트, 디센딩으로 큰것부터 작은 걸로. 이걸 가지고 있는 게 bow.




#한글 word cloud 절차
#1. java 실행 환경 구축(jre, java run-time enviroment)
#2. konlp 패키지 설치/load  :자바 실행환경이 먼저 구축되어야 함.
#3. 사용자 사전 설정
#4. 자료수집 (text 자료)
#   4-1. text file 형태로 수집   :메모장으로 읽을 수 있으면 text file
#   4-2. web scraping을 이용한 수집
#5. 명사 추출.
#6. 추출한 명사의 빈도수 계산-table
#7. 빈도수순으로 sort(descending)
#8. 한글 word cloud 표현.
#
#r에서 한글 word cloud를 이용하기 위해서는 java 실행환경, jre가 필요.

Sys.setenv(JAVA_HOME="C:/Users/life/corretto/jdk11.0.7_10")
#시스템-고급환경설정-고급-환경변수 보기에서 자바 등록된 이거로 하기.
install.packages("wordcloud")  #word cloud용 패키지
install.packages("wordcloud2") #word cloud용 패키지
install.packages("RColorBrewer") #색상 팔레트


library(wordcloud)
library(wordcloud2)
library(RColorBrewer)

library(dplyr)
library(ggplot2)

#4번,자료 수집
setwd("C://Users//life//Desktop//wordcloud")
text <- readLines('mis_document.txt', encoding = "UTF-8") #인코딩 필수. 만약 이렇게 했는데 한글이 깨지면 인코딩 빼고 할 것.
text


#notepad++ 설치하기.64비트... 라면.
#반드시 마지막에 빈줄이 한줄 이상 들어가 있어야 한다.

#사용자 한글 사전 '우리말씀' 로딩 konlp 설치 및 usendic 안되어있으면 못함.
buildDictionary(ext_dic='woorimalsam')
pal2 <- brewer.pal(8,'Dark2')  #색상 팔레트 생성
noun <- sapply(text, extractNoun, USE.NAMES = F) #명사 추출. 5번.
noun

#6. 추출한 명사의 빈도수 계산
noun2 <- unlist(noun) #list <- vector 변환
wordcount <- table(noun2)

#7. 빈도수 순으로 sort(descending)
sort.noun <- sort(wordcount, decreasing = T)[1:10] #10개까지만.
sort.noun
#아마 공백이 가장 많다고 나올 것. 공백(스페이스)
sort.noun <- sort.noun[-1] #필요없는 열 제거
barplot(sort.noun, names.arg = names(sort.noun),
        col = 'steelblue', main = '빈도수 높은 단어',
        ylab='단어 빈도수')

#8.한글 word cloud 작성.
pal3 <- brewer.pal(9, 'Blues')[5:9] #색상 팔레트 생성
wordcloud(names(wordcount),
          freq = wordcount,
          main.freq=3,
          random.order = F,
          rot.per = .1,
          colors = pal3)

#wordcloud(names(wordcount),       단어
#          freq = wordcount,       단어 빈도
#          main.freq=3,            단어 폰트 크기(최대, 최소)
#          random.order = F,       단어최소빈도
#          rot.per = .1,           90도 회전 단어 비율
#          colors = pal3)          단어색



#한글 word cloud를 위한 전처리
#1. 불필요한 단어 삭제
#2. 생략된 단어를 사전에 등재
buildDicitionary(ext_dic='woorimalsam',
                user_dic=data.frame('정치','ncn'),
                replace_usr_dic=T)
noun <- sapply(text, extractNoun, USE.NAMES = F)
noun2 <- unlist(noun2)

#1.불필요한 단어 삭제(불용어, stop word)
noun2 <- noun2[nchar(noun2)>1] #빈도수가 2이상인 것만 포함하겠다.
noun2 <- gsub('하지',' ',noun2)
wordcount <- table(noun2)
wordcloud(names(wordcount), freq = wordcount,
          scale = c(6,0.7), main.freq=3,
          random.color = F, rot.per = .1, colors = pal3)

wordcloud2(wordcount,color = 'random-light',
           backgroundColor = 'black')
#wordcloud2가 원하는 모양 만들기는 조금 더 쉬움.

#모양 변경
wordcloud2(wordcount, fontFamily = '맑은 고딕',
           size=1.2, color='random-light',
           backgroundColor='black',
           shape='star')                        #모양을 만드는 것.

#색상 변경
wordcloud2(demoFreq, size=1.6,
          color =rep_len(c('red','blue'),           #내가 원하는 색깔을 지정하는 것.
                         nrow(wordcount)))

#일정 방향 정렬
wordcloud2(wordcount,
           minRotation = -pi/6,
           maxRotation = -pi/6,
           rotateRatio = 1)

#
#조별 1차 프로젝트
#
#문제정의는 되어있다. eda에서 이걸 할 필요는 없다. 결론도 역시 차이로 정해져있다.