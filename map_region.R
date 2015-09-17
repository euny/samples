#+ global_options, echo = F, results = "hide" 
library(knitr)
opts_chunk$set(dpi = 144, cache=TRUE)
options(width=120)
library(ggplot2)
library(plyr)

#' ---
#' title: '지도를 지역별로 구분해서 그리기'
#' css: custom.css
#' ---


#' ## 지도 데이터를 구해서... 
#' 
#' 맵 데이터 위치: `./mapdata/` (출처: http://www.gisdeveloper.co.kr/979 )
#' 
#' - CTPRVN_201506  시도 
#' - SIG_201506     시군구 
#' - EMD_201506     읍면동 
#' - LI_201506      리 
#' 

#' ## 시도 데이터를 읽어봅시다. 
#'
#' ### 좌표계와 각종 정보 확인
library(maptools)
library(rgdal)

map_dir = './mapdata'
ogrInfo(map_dir, layer="ctp_rvn")  # layer = 파일이름 (확장자 없이)
x.dat = readOGR(map_dir, layer='ctp_rvn')

#' ### 좌표 변환 
#' 
#' 원본 좌표계를 그대로 이용해도 되지만,   
#' 다른 데이터를 표시하기 위해 경위도 좌표계로 변환합니다.   
#' 참고링크: http://www.osgeo.kr/17
to.crs = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
x.dat.tr = spTransform(x.dat, CRS=to.crs)

#' ### 지역 이름 확인
#' 
#' data 테이블에 지역별 코드와 이름이 들어있습니다.   
slotNames(x.dat.tr)
x.dat.tr@data$CTP_KOR_NM_UTF8 = iconv(x.dat.tr@data$CTP_KOR_NM, "cp949", "UTF-8") # 인코딩 변환 
x.dat.tr@data 

#' ### 지역 이름을 표시할 좌표 확인
#' 이미 지도 안에 들어있는 정보를 이용
slotNames(x.dat.tr@polygons[[1]])
x.dat.tr@polygons[[1]]@labpt
x.dat.labpt = ldply(x.dat.tr@polygons, slot, "labpt")
x.dat.tr.text = data.frame(label = x.dat.tr@data$CTP_KOR_NM_UTF8, 
                           long = x.dat.labpt[,1], 
                           lat = x.dat.labpt[,2])
x.dat.tr.text

#' 위 방법이 안되면 - 중앙 좌표를 계산
library(rgeos)
x.dat.centroids = gCentroid(x.dat.tr, byid=TRUE)
x.dat.tr.text2 = data.frame(label = x.dat.tr@data$CTP_KOR_NM_UTF8, 
                            long = coordinates(x.dat.centroids)[,1], 
                            lat = coordinates(x.dat.centroids)[,2])
x.dat.tr.text2

#' ## 지도를 그려봅시다.

#' plot 함수를 이용해서 
plot(x.dat.tr, axes = T)
text( x.dat.tr.text$long, x.dat.tr.text$lat, labels=x.dat.tr.text$label, col="blue", cex = .7 ) 

#' ggplot 함수를 이용해서 
x.dat.tr.ft = fortify(x.dat.tr)
ggplot(x.dat.tr.ft) + geom_polygon(aes(x = long, y = lat, group = group), colour = "white") + 
  geom_text( aes(x=long,y=lat,label=label, size = .3), colour = 'grey', data = x.dat.tr.text) 

#' ## 같은 방식으로, 서울시의 시군구 지도를 그려봅시다. 

#' ### 지도 데이터 준비 
ogrInfo(map_dir, layer="sig")  
x.dat = readOGR(map_dir, layer='sig')
x.dat.tr = spTransform(x.dat, CRS=to.crs)
x.dat.tr@data$SIG_KOR_NM_UTF8 = iconv(x.dat.tr@data$SIG_KOR_NM, "cp949", "UTF-8")
x.dat.tr@data

#' ### 서울시 데이터만 추리기 
#' 서울시 지역코드는 11 번이므로 (위의 테이블 참고),   
#' 서울시 지역코드로 시작하는 시군구 코드만 남겨서 그립니다.    
#' 참고링크: http://byhou.tistory.com/390
x.dat.tr = subset(x.dat.tr, substr(SIG_CD, 1, 2) == "11")

#' ### 이후 과정은 동일 
x.dat.labpt = ldply(x.dat.tr@polygons, slot, "labpt")
x.dat.tr.text = data.frame(label = x.dat.tr@data$SIG_KOR_NM_UTF8, 
                           long = x.dat.labpt[,1], 
                           lat = x.dat.labpt[,2])
x.dat.tr.ft = fortify(x.dat.tr)
#' plot 함수를 이용해서 
plot(x.dat.tr, axes = T)
text( x.dat.tr.text$long, x.dat.tr.text$lat, labels=x.dat.tr.text$label, col="blue", cex = .7 ) 

#' ggplot 함수를 이용해서 
x.dat.tr.ft = fortify(x.dat.tr)
ggplot(x.dat.tr.ft) + geom_polygon(aes(x = long, y = lat, group = group), colour = "white") + 
  geom_text( aes(x=long,y=lat,label=label, size = .3), colour = 'grey', data = x.dat.tr.text) 


