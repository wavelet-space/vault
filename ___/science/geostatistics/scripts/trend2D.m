function zdp = trend2D(xd,yd,zd,xg,yg,st_pol,h)
% Prolozeni globalniho ci lokalniho trendu.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% st_pol ... stupen polynomu (0 az 3)
% h>0 ... prolozi se lokalni trend, h ridi miru lokalnosti
% h<=0 ... prolozi se globalni trend
% zdp ... rezidua po odecteni trendu od dat
% Vyuziva funkci trend.
%
% Priklady vyvolani:
% zdp=pol_trend_2D(xd,yd,zd,[0:10:200],[0:10:200],3,0);
% pol_trend_2D(xd,yd,zd,[0:5:200],[0:5:200],1,10);
% pol_trend_2D(xd,yd,zd,[0:5:200],[0:5:200],1,1000);
% 
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure
% plot3(xd,yd,zd,'ko')
ms=15;
plot3(xd,yd,zd,'k.','markersize',ms)
hold on
 
[Xg,Yg]=meshgrid(xg,yg); % interpolovana sit
x=Xg(:); y=Yg(:); % prevedeni na sloupcove vektory
 
z=trend(xd,yd,zd,x,y,st_pol,h); % vypocet trendu v bodech gridu
zdp=trend(xd,yd,zd,xd,yd,st_pol,h); % hodnoty trendu v datovych bodech
 
Zg=reshape(z,size(Xg)); % prevod vektoru z do struktury site
surf(Xg,Yg,Zg)
% shading interp
colormap(gray*2/3+1/3)
grid on
nd=length(xd)
hold on
for i=1:nd
    plot3([xd(i),xd(i)],[yd(i),yd(i)],[zdp(i),zd(i)],'k-')
end
 
% izolinie
figure
[c,hc] = contourf(Xg,Yg,Zg,[0:1:25]);
clabel(c,hc,[2:2:20]) % vyber izolinii s popisem
fs=12;
xlabel('x','fontsize',fs)
ylabel('y','fontsize',fs,'rotation',0)
xmin=min(xg); xmax=max(xg); ymin=min(yg); ymax=max(yg);
axis([xmin,xmax,ymin,ymax])
set(gca,'XTick',[xmin:50:xmax])
set(gca,'YTick',[ymin:50:ymax])
pos=get(gcf,'position');
set(gcf,'position',[10 pos(2) pos(3)*3/4 pos(4)*0.95] )
colormap(gray*2/3+1/3)
hold on
plot(xd,yd,'k.','markersize',ms)
box on
axis([xmin,xmax,ymin,ymax])
axis equal
 
% rezidua zobrazena skalovanymi symboly (velikost podle abs(r))
figure
set(gcf,'position',[110 pos(2) pos(3)*3/4 pos(4)*0.95] )
box on
hold on
grid on
xlabel('x','fontsize',fs)
ylabel('y','fontsize',fs,'rotation',0)
axis([xmin,xmax,ymin,ymax])
set(gca,'XTick',[xmin:50:xmax])
set(gca,'YTick',[ymin:50:ymax])
r=zd-zdp;
q=5;
for i=1:nd % rezidua se vykresli skalovanym symbolem o
    plot(xd(i),yd(i),'ko','markersize',abs(r(i))*q,'linewidth',1)
    if r(i)<0 % zaporna rezidua jsou oznacena x
        plot(xd(i),yd(i),'kx','markersize',abs(r(i))*q,'linewidth',1)
    end
end
% tucne vyznacime minimum a maximum
min_r=min(r), max_r=max(r)
imin=find(r==min_r) % index(y) minimalni hodnoty
plot(xd(imin),yd(imin),'ko','markersize',abs(r(imin))*q,'linewidth',2)
imax=find(r==max_r) % index(y) maximalni hodnoty
plot(xd(imax),yd(imax),'ko','markersize',abs(r(imax))*q,'linewidth',2)
 
 
% pro posouzeni predchoziho zobrazeni rezidui se hodi take  zobrazeni dat
% skalovanymi symboly (velikost podle zd)
figure
set(gcf,'position',[310 pos(2) pos(3)*3/4 pos(4)*0.95] )
box on
hold on
grid on
xlabel('x','fontsize',fs)
ylabel('y','fontsize',fs,'rotation',0)
axis([xmin,xmax,ymin,ymax])
set(gca,'XTick',[xmin:50:xmax])
set(gca,'YTick',[ymin:50:ymax])
q=1.5;
for i=1:nd
    plot(xd(i),yd(i),'ko','markersize',(zd(i)-min(zd)+1)*q,'linewidth',1)
    if zd(i)<mean(zd) % podprumerne hodnoty jsou oznaceny x
        plot(xd(i),yd(i),'kx','markersize',(zd(i)-min(zd)+1)*q,...
            'linewidth',1)
    end
end
% tucne vyznacime minimum a maximum
min_zd=min(zd), max_zd=max(zd)
imin=find(zd==min_zd) % index(y) minimalni hodnoty
plot(xd(imin(1)),yd(imin(1)),'ko',...
    'markersize',(zd(imin(1))-min(zd)+2)*q,'linewidth',2)
plot(xd(imin(2)),yd(imin(2)),'ko',...
    'markersize',(zd(imin(2))-min(zd)+2)*q,'linewidth',2)
imax=find(zd==max_zd) % index(y) maximalni hodnoty
plot(xd(imax),yd(imax),'ko','markersize',(zd(imax)-min(zd)+2)*q,...
    'linewidth',2)
 