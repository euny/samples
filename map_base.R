#+ global_options, echo = F, results = "hide" 
library(knitr)
opts_chunk$set(cache=FALSE)
options(width=120)

#' ---
#' title: '지도 밑바탕 그리기'
#' css: custom.css
#' ---

#' ## 라이브러리  
library(ggmap)

#' ## Google 
qmap( location = "서울" , zoom = 12 , maptype = "terrain")
qmap( location = "서울" , zoom = 12 , maptype = "satellite")
qmap( location = "서울" , zoom = 12 , maptype = "hybrid")
qmap( location = "서울" , zoom = 12 , maptype = "roadmap")
qmap( location = "서울" , zoom = 12 , maptype = "roadmap", color = "bw")  # 흑백 


#' ## NaverMap 
#' * key 를 발급받아야 해서 번거롭다.
#' * overlayers 를 하나도 깔지 않은 지도를 그릴 수 없다?!
#' 
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "서울", zoom = 6, baselayer = "default", overlayers = "traffic") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "서울", zoom = 6, baselayer = "default", overlayers = "bicycle") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "서울", zoom = 6, baselayer = "default", overlayers = "roadview") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "서울", zoom = 6, baselayer = "default", overlayers = "anno_satellite") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "서울", zoom = 6, baselayer = "satellite", overlayers = "anno_satellite") )


#' ## OpenStreetMap
qmap( location = "서울" , zoom = 12, source = "osm") # 한참 걸려요... 


#' ## Stamen 
#' http://maps.stamen.com/ 에서도 지도를 확인할 수 있다. 
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-background")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-lite")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-hybrid")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-labels")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-lines")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-2010")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-2011")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "watercolor")

#' 아래 지도는 미국만 됨 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-background")   
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-labels")       
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-lines")       
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain")              
