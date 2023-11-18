function RBF_2D(xd,yd,zd,xg,yg,s)
% Interpolace metodou RBF s multikvadrikou.
% xd,yd,zd ... data (sloupcove vektory)
% xg, yg ... vektory definujici grid
% s ... parametr ovlivnujici vypnuti interpolacni plochy
% Vyuziva funkci IDW_1b_2D.
%
% Priklad vyvolani:
% RBF_2D(xd,yd,zd,[0:5:200],[0:5:200],0)
% 
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure
plot3(xd,yd,zd,'o')
hold on
% 'pause', pause

[Xg,Yg]=meshgrid(xg,yg); % interpolovana sit
x=Xg(:); y=Yg(:); % prevedeni na sloupcove vektory
 
% vypocet koeficientu a(i) a b
nd=length(xd);
for i=1:nd
    for j=1:nd
        r(i,j)=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2);
    end
end
R=sqrt(r.^2+s^2); % bazova funkce - multikvadrika
L=[R ones(nd,1); [ones(1,nd) 0]];
P=[zd; 0];
% L*X=P => X=inv(L)*P, popr. X=(L^-1)*P nebo X=L\P
X=inv(L)*P;
a=X(1:nd);
b=X(nd+1);
 
nx=length(x);
for i=1:nx % interpolace v bodech [x(i),y(i)]
    for j=1:nd
        r0(j)=sqrt((x(i)-xd(j))^2+(y(i)-yd(j))^2);
    end
    R0=sqrt(r0.^2+s^2);
    
    z(i)=R0*a+b;
%     plot3(x(i),y(i),z(i),'r.')
%     pause(0.001)
end
 
Zg=reshape(z,size(Xg)); % prevod vektoru z do struktury site
surf(Xg,Yg,Zg)
% axis([0 200 0 200 0 25])
% view(-30,60)
grid on
% shading interp
% colormap(gray)
% colormap(gray*2/3+1/3)
fs=12;
xlabel('x','fontsize',fs)
ylabel('y','fontsize',fs)
zlabel('z','fontsize',fs,'rotation',0)
 
figure
% pos=get(gcf,'position');
% set(gcf,'position',[pos(1) pos(2) pos(3)*0.8 pos(4)])
% axis equal
[c,h] = contourf(Xg,Yg,Zg,[0:1:25]);
clabel(c,h,[2:2:20])
% colormap(gray*2/3+1/3)
hold on
plot(xd,yd,'k.')
% plot(xd,yd,'k.','markersize',15)
box on
xlabel('x')
ylabel('y','rotation',0)
