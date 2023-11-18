function pol_trend_2D(xd,yd,zd,xg,yg,st_pol,h)

% Upravena funkce pol_trend_2D z GPI.

% Prolozeni globalniho ci lokalniho trendu.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% st_pol ... stupen polynomu (0 az 3)
% h>0 ... prolozi se lokalni trend, h ridi miru lokalnosti
% h<=0 ... prolozi se globalni trend
%
% Vyuziva funkci trend (prilozena nize).
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
% colormap(gray*2/3+1/3)
grid on
nd=length(xd)
hold on
for i=1:nd
    plot3([xd(i),xd(i)],[yd(i),yd(i)],[zdp(i),zd(i)],'k-')
end



% -------------------------------------------------------------------------

function z=trend(xd,yd,zd,x,y,st_pol,h)
% Prolozeni globalniho ci lokalniho trendu.
% xd,yd,zd ... data
% x, y ... souradnice bodu, v nichz se pocita trend
% st_pol ... stupen polynomu (0 az 3)
% h ... parametr ridici miru lokalnosti trendu (pokud h>0)
% h<=0 ... prolozi se globalni trend (prakticky tez pro velke hodnoty h)
% z ... prolozeny trend

n=length(x);
nd=length(xd);
I=ones(nd,1);
for i=1:n
    for j=1:nd
        if h>0% lokalni tend
            r=sqrt((x(i)-xd(j))^2+(y(i)-yd(j))^2);
            w(j)=exp(-r/h);
        else % globalni trend
            w(j)=1;
        end
    end
    W=diag(w);
    Z=zd;
    if st_pol==0
        X=I;
        B=inv(X'*W*X)*X'*W*Z;
        z(i)=B;
    elseif st_pol==1
        X=[I,xd,yd];
        B=inv(X'*W*X)*X'*W*Z;
        % z(i)=B(1)+B(2)*x(i)+B(3)*y(i)
        z(i)=[1,x(i),y(i)]*B;
    elseif st_pol==2
        X=[I,xd,yd,xd.^2,yd.^2,xd.*yd];
        B=inv(X'*W*X)*X'*W*Z;
        % z(i)=B(1)+B(2)*x(i)+B(3)*y(i)+B(4)*x(i)^2+B(5)*y(i)^2...
        % +B(6)*x(i)*y(i);
        z(i)=[1,x(i),y(i),x(i)^2,y(i)^2,x(i)*y(i)]*B;
    elseif st_pol==3
        X=[I,xd,yd,xd.^2,yd.^2,xd.*yd,(xd.^2).*yd,(yd.^2).*xd,xd.^3,yd.^3];
        B=inv(X'*W*X)*X'*W*Z;
        % z(i)=B(1)+B(2)*x(i)+B(3)*y(i)+B(4)*x(i)^2+B(5)*y(i)^2...
        % +B(6)*x(i)*y(i)... [dopln sam]
        z(i)=[1,x(i),y(i),x(i)^2,y(i)^2,x(i)*y(i),x(i)^2*y(i),...
            y(i)^2*x(i),x(i)^3,y(i)^3]*B;
    end
    % plot3(x(i),y(i),z(i),'r.')
    % pause(0.001)
end
z=z';
