### ���� ���� 
library(ggmap)

# Google 
qmap( location = "����" , zoom = 12 , maptype = "terrain")
qmap( location = "����" , zoom = 12 , maptype = "satellite")
qmap( location = "����" , zoom = 12 , maptype = "hybrid")
qmap( location = "����" , zoom = 12 , maptype = "roadmap")
qmap( location = "����" , zoom = 12 , maptype = "roadmap", color = "bw")  # ��� 

# OpenStreetMap
qmap( location = "����" , zoom = 12, source = "osm") # ���� �ɷ���... 

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

qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-background")  # �̱��� �� 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-labels")      # �̱��� �� 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain-lines")      # �̱��� �� 
qmap( location = "Newyork" , zoom = 12 , source = "stamen", maptype = "terrain")             # �̱��� �� 

# NaverMap 
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "����", zoom = 6, baselayer = "default", overlayers = "traffic") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "����", zoom = 6, baselayer = "default", overlayers = "bicycle") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "����", zoom = 6, baselayer = "default", overlayers = "roadview") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "����", zoom = 6, baselayer = "default", overlayers = "anno_satellite") )
ggmap( get_navermap(key="967590eb29f58ed9c53ba5ecd3452695", uri="www.r-project.org", 
                    location = "����", zoom = 6, baselayer = "satellite", overlayers = "anno_satellite") )
