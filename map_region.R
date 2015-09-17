#+ global_options, echo = F, results = "hide" 
library(knitr)
opts_chunk$set(dpi = 144, cache=TRUE)
options(width=120)
library(ggplot2)
library(plyr)

#' ---
#' title: '������ �������� �����ؼ� �׸���'
#' css: custom.css
#' ---


#' ## ���� �����͸� ���ؼ�... 
#' 
#' �� ������ ��ġ: `./mapdata/` (��ó: http://www.gisdeveloper.co.kr/979 )
#' 
#' - CTPRVN_201506  �õ� 
#' - SIG_201506     �ñ��� 
#' - EMD_201506     ���鵿 
#' - LI_201506      �� 
#' 

#' ## �õ� �����͸� �о�ô�. 
#'
#' ### ��ǥ��� ���� ���� Ȯ��
library(maptools)
library(rgdal)

map_dir = './mapdata'
ogrInfo(map_dir, layer="ctp_rvn")  # layer = �����̸� (Ȯ���� ����)
x.dat = readOGR(map_dir, layer='ctp_rvn')

#' ### ��ǥ ��ȯ 
#' 
#' ���� ��ǥ�踦 �״�� �̿��ص� ������,   
#' �ٸ� �����͸� ǥ���ϱ� ���� ������ ��ǥ��� ��ȯ�մϴ�.   
#' ������ũ: http://www.osgeo.kr/17
to.crs = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
x.dat.tr = spTransform(x.dat, CRS=to.crs)

#' ### ���� �̸� Ȯ��
#' 
#' data ���̺��� ������ �ڵ�� �̸��� ����ֽ��ϴ�.   
slotNames(x.dat.tr)
x.dat.tr@data$CTP_KOR_NM_UTF8 = iconv(x.dat.tr@data$CTP_KOR_NM, "cp949", "UTF-8") # ���ڵ� ��ȯ 
x.dat.tr@data 

#' ### ���� �̸��� ǥ���� ��ǥ Ȯ��
#' �̹� ���� �ȿ� ����ִ� ������ �̿�
slotNames(x.dat.tr@polygons[[1]])
x.dat.tr@polygons[[1]]@labpt
x.dat.labpt = ldply(x.dat.tr@polygons, slot, "labpt")
x.dat.tr.text = data.frame(label = x.dat.tr@data$CTP_KOR_NM_UTF8, 
                           long = x.dat.labpt[,1], 
                           lat = x.dat.labpt[,2])
x.dat.tr.text

#' �� ����� �ȵǸ� - �߾� ��ǥ�� ���
library(rgeos)
x.dat.centroids = gCentroid(x.dat.tr, byid=TRUE)
x.dat.tr.text2 = data.frame(label = x.dat.tr@data$CTP_KOR_NM_UTF8, 
                            long = coordinates(x.dat.centroids)[,1], 
                            lat = coordinates(x.dat.centroids)[,2])
x.dat.tr.text2

#' ## ������ �׷����ô�.

#' plot �Լ��� �̿��ؼ� 
plot(x.dat.tr, axes = T)
text( x.dat.tr.text$long, x.dat.tr.text$lat, labels=x.dat.tr.text$label, col="blue", cex = .7 ) 

#' ggplot �Լ��� �̿��ؼ� 
x.dat.tr.ft = fortify(x.dat.tr)
ggplot(x.dat.tr.ft) + geom_polygon(aes(x = long, y = lat, group = group), colour = "white") + 
  geom_text( aes(x=long,y=lat,label=label, size = .3), colour = 'grey', data = x.dat.tr.text) 

#' ## ���� �������, ������� �ñ��� ������ �׷����ô�. 

#' ### ���� ������ �غ� 
ogrInfo(map_dir, layer="sig")  
x.dat = readOGR(map_dir, layer='sig')
x.dat.tr = spTransform(x.dat, CRS=to.crs)
x.dat.tr@data$SIG_KOR_NM_UTF8 = iconv(x.dat.tr@data$SIG_KOR_NM, "cp949", "UTF-8")
x.dat.tr@data

#' ### ����� �����͸� �߸��� 
#' ����� �����ڵ�� 11 ���̹Ƿ� (���� ���̺� ����),   
#' ����� �����ڵ�� �����ϴ� �ñ��� �ڵ常 ���ܼ� �׸��ϴ�.    
#' ������ũ: http://byhou.tistory.com/390
x.dat.tr = subset(x.dat.tr, substr(SIG_CD, 1, 2) == "11")

#' ### ���� ������ ���� 
x.dat.labpt = ldply(x.dat.tr@polygons, slot, "labpt")
x.dat.tr.text = data.frame(label = x.dat.tr@data$SIG_KOR_NM_UTF8, 
                           long = x.dat.labpt[,1], 
                           lat = x.dat.labpt[,2])
x.dat.tr.ft = fortify(x.dat.tr)
#' plot �Լ��� �̿��ؼ� 
plot(x.dat.tr, axes = T)
text( x.dat.tr.text$long, x.dat.tr.text$lat, labels=x.dat.tr.text$label, col="blue", cex = .7 ) 

#' ggplot �Լ��� �̿��ؼ� 
x.dat.tr.ft = fortify(x.dat.tr)
ggplot(x.dat.tr.ft) + geom_polygon(aes(x = long, y = lat, group = group), colour = "white") + 
  geom_text( aes(x=long,y=lat,label=label, size = .3), colour = 'grey', data = x.dat.tr.text) 

