function IDW_2D(xd,yd,zd,xg,yg,a)
% Interpolace metodou IDW.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% a ... mocnina vzdalenosti
% Vyuziva funkci IDW_1b_2D.
% 
% Priklad vyvolani:
% [xd,yd,zd]=data_33000;
% IDW_2D(xd,yd,zd,[0:5:200],[0:5:200],2)
% 
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure
plot3(xd,yd,zd,'o'), hold on
'pause', pause

[Xg,Yg]=meshgrid(xg,yg); % interpolovana sit
x=Xg(:); y=Yg(:); % prevedeni na sloupcove vektory
 
nx=length(x)
for i=1:nx % interpolace v bodech x(i) a y(i)
    z(i)=IDW_1b_2D(xd,yd,zd,x(i),y(i),a);
%     plot3(x(i),y(i),z(i),'r.')
%     pause(0.001)
end
 
Zg=reshape(z,size(Xg)); % prevod vektoru z do struktury site
surf(Xg,Yg,Zg)
grid on
'pause', pause
 
figure
% pos=get(gcf,'position');
% set(gcf,'position',[pos(1) pos(2) pos(3)*0.8 pos(4)])
% axis equal
[c,h] = contourf(Xg,Yg,Zg);
clabel(c,h)
% [c,h] = contourf(Xg,Yg,Zg,[0:1:25]);
% clabel(c,h,[2:2:20])
% colormap(gray*2/3+1/3)
hold on
plot(xd,yd,'k.')
% plot(xd,yd,'k.','markersize',15)
box on
 
function z=IDW_1b_2D(xd,yd,zd,x,y,a)
% Interpolace v 1 bode (o souradnicich x,y) pomoci IDW.
nd=length(xd);
for i=1:nd
    r=sqrt((x-xd(i))^2+(y-yd(i))^2); 
    if r==0
        z=zd(i);
        return
    else
        lam(i)=1/r^a;
    end
end 
lam=lam/sum(lam); 
z=lam*zd
