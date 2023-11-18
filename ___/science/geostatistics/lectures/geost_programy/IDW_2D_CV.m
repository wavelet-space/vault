function IDW_2D_CV(xd,yd,zd,xg,yg,a)
% Ukazka cross-validation pri interpolaci metodou IDW.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% a ... mocnina vzdalenosti 
% Vyuziva funkci IDW_1b_2D.
% 
% Priklad vyvolani:
% [xd,yd,zd]=data_33000;
% IDW_2D_cross_validation(xd,yd,zd,[0:5:200],[0:5:200],2)
%
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure
plot3(xd,yd,zd,'o')
hold on
'pause', pause
 
nd=length(xd)
 
for i=1:nd 
    ind=setdiff([1:nd],i); % vynechame i-ty bod
    % interpolace i-teho bodu
    z(i)=IDW_1b_2D(xd(ind),yd(ind),zd(ind),xd(i),yd(i),a);
    e(i)=z(i)-zd(i); % chyba CV
    
    plot3(xd(i),yd(i),z(i),'r.')
    plot3([xd(i) xd(i)],[yd(i) yd(i)],[zd(i) z(i)],'r-')
    pause(0.001)
end
 
me=mean(e) % prumerna chyba
rmse=sqrt(mean(e.^2)) % stredni kvadraticka chyba
mae=mean(abs(e)) % prumerna absolutni chyba
 
figure
hist(e), xlabel('e')
 
figure
pos=get(gcf,'position');
set(gcf,'position',[pos(1) pos(2) pos(3)*0.8 pos(4)])
% axis equal
plot(zd,z,'.')
xlabel('data')
ylabel('predikce')
hold on
plot([min(zd) max(zd)],[min(zd) max(zd)],'k--')
title(['me=',num2str(me),'  rmse=',num2str(rmse)])
axis([min(zd) max(zd) min(zd) max(zd)])
 
% regresni primka
c=cov(zd,z);
b=c(1,2)/var(zd)
a=mean(z)-b*mean(zd)
%plot(zcv,a+b*zcv,'k-')
x1=min(zd); x2=max(zd);
y1=a+b*x1; y2=a+b*x2;
plot([x1,x2],[y1,y2],'r-')

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
z=lam*zd;

