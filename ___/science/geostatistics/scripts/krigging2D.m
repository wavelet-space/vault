function krigging2D(xd,yd,zd,xg,yg,vario,nu,ierr)
% Interpolace metodou ordinary kriging.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% vario ... variogram jako funkce vzdalenosti h (textovy retezec)
% nu ... velikost nugget efektu
% iqerr ... zda nuggget efekt priradime mikrovariabilite nebo chybe mereni
% iqerr=0 ... mikrovariabilita, OK je presny interpolator
% iqerr=1 ... chyba mereni, OK shlazuje (odfiltruje chybu mereni)
% 
% Priklady vyvolani:
% s linearnim variogramem a nulovym nugget effektem
% OK_2D(xd,yd,zd,[0:5:200],[0:5:200],'h',0,0) 

% se sférickým variogramem s prahem 8 a dosahem 70 m 
% vario='8*(3/2*min(h,70)/70-1/2*min(h,70).^3/70^3)'
% OK_2D(xd,yd,zd,[0:5:200],[0:5:200],vario,0,0)

% predchozi sfericky variogram kombinovaný s malým nugget efektem 0.5,
% ktery je prirazen chybe mereni (iqerr=1)
% OK_2D(xd,yd,zd,[0:5:200],[0:5:200],vario,0.5,1)
%
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure 
plot3(xd,yd,zd,'o')
hold on
% 'pause', pause
 
[Xg,Yg]=meshgrid(xg,yg); % interpolovana sit
x=Xg(:); y=Yg(:); % prevedeni na sloupcove vektory
 
% variogram leve strany soustavy krigingu
nugget=strcat('(heaviside(h)-heaviside(-h))*',num2str(nu));
varioL=strcat(nugget,'+',vario);
% variogram prave strany soustavy krigingu
if ierr==1 % chyba mereni
    varioP=vario;
else % mikrovariabilita
    varioP=varioL;
end
 
nd=length(xd);
for i=1:nd % hodnoty variogramu na leve strane (ctvercova matice G)
    for j=1:nd
        h=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2);
        G(i,j)=eval(varioL);
    end
end
 
nx=length(x), J=ones(nd,1);
for i=1:nx % cyklus pres vsechny krigovane body
    for j=1:nd % hodnoty variogramu na prave strane (vektor g)
        h=sqrt((x(i)-xd(j))^2+(y(i)-yd(j))^2);
        g(j)=eval(varioP);
    end
    % soustava krigingu a jeji reseni
    A=[ G  J;
        J' 0];
    B=[g 1]';
    X=inv(A)*B;
    lam=X(1:nd)';
    miL=X(nd+1);
    % krigovana hodnota
    z(i)=lam*zd; 
    % plot3(x(i),y(i),z(i),'r.')
    % pause(0.001)
end
 
Zg=reshape(z,size(Xg)); % prevod vektoru z do struktury site
surf(Xg,Yg,Zg)
grid on
% 'pause', pause
 
figure
pos=get(gcf,'position');
set(gcf,'position',[pos(1) pos(2) pos(3)*0.8 pos(4)])
% axis equal
[c,h] = contourf(Xg,Yg,Zg);
clabel(c,h)
% [c,h] = contourf(Xg,Yg,Zg,[0:1:25]);
% clabel(c,h,[2:2:20])
% colormap(gray*2/3+1/3)
hold on
plot(xd,yd,'k.','markersize',13)
box on
title('Kriging 2D')
