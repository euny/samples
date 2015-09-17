### 지도 샘플 
library(ggmap)

# Google 
qmap( location = "서울" , zoom = 12 , maptype = "terrain")
qmap( location = "서울" , zoom = 12 , maptype = "satellite")
qmap( location = "서울" , zoom = 12 , maptype = "hybrid")
qmap( location = "서울" , zoom = 12 , maptype = "roadmap")
qmap( location = "서울" , zoom = 12 , maptype = "roadmap", color = "bw")  # 흑백 

# OpenStreetMap
qmap( location = "서울" , zoom = 12, source = "osm") # 한참 걸려요... 

# Stamen http://maps.stamen.com/
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-background")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-lite")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-hybrid")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-labels")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-lines")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-2010")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "toner-2011")
qmap( location = "Seoul" , zoom = 12 , source = "stamen", maptype = "watercolor")

qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-background")  # 미국만 됨 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-labels")      # 미국만 됨 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-lines")      # 미국만 됨 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain")             # 미국만 됨 

# NaverMap 
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

