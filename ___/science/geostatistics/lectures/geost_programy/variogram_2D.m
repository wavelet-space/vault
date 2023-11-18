function variogram_2D(xd,yd,zd,lag,maxlag,vario)
% Vypocet empirickeho variogramu a vykresleni teoretickeho variogramu.
% xd,yd,zd ... data (sloupcove vektory)
% lag ... krok empirickeho variogramu
% maxlag ... maximalni uvazovana vzdalenost
% vario ... variogram jako funkce vzdalenosti h zadany jako textovy retezec
%
% Priklady vyvolani:
% nejprve pripravime sferický variogram s prahem 8 a dosahem 70 m
% vario='8*(3/2*min(h,70)/70-1/2*min(h,70).^3/70^3)';
% pak spustime program
% variogram_2D(xd,yd,zd,20,150,vario)
% nebo najednou
% variogram_2D(xd,yd,zd,20,150,'8*(3/2...70^3)')
%
% Priklady teoretickych variogramu:
% sferický variogram s prahem 8 a dosahem 70 m
% vario='8*(3/2*min(h,70)/70-1/2*min(h,70).^3/70^3)';
% podobny exponencialni variogram s dosahem ~ 70 m
% vario='8*(1-exp(-(3*h/70)))';
% predchozi sfericky variogram kombinovany s malym nugget efektem 0.5
% vario='(heaviside(h)-heaviside(-h))*0.5+8*(3/2*min(h,70)/70...
% -1/2*min(h,70).^3/70^3)';
% pripadne si uzivatel muze vytvorit zvlastni funkci pro generovani
% teoretickeho variogramu podle zadaneho typu a hodnot parametru :)
%
% Material k textu Geostatistika a prostorova interpolace, JJ2015.
 
format compact, close all
 
figure
subplot(2,2,1)
plot(xd,yd,'o')
title('data')
 
% variogram cloud
nd=length(xd);
k=0;
for i=1:nd
    for j=i+1:nd
        k=k+1;
        h(k)=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2);
        d(k)=1/2*(zd(i)-zd(j))^2;
    end
end
subplot(2,2,2)
plot(h,d,'b.')
% xlim([0 maxlag])
title('variogram mrak')
hold on
 
% vypocet empirickeho variogramu
nh=length(h);
maxit=fix(maxlag/lag)+1; % maximalni index tridy
ng=zeros(1,maxit);
s=zeros(1,maxit);
for k=1:nh
    if h(k)<=maxlag
        it=fix(h(k)/lag)+1;
        ng(it)=ng(it)+1;
        s(it)=s(it)+d(k);
    end
end
g=s./ng % empiricky variogram
t=[1:maxit]*lag-lag/2 % odpovidajici stredy trid
plot(t,g,'r.')
subplot(2,2,3)
plot(t,g,'r.-')
xlim([0 maxlag])
title('empiricky variogram')
for it=1:length(g) % pocty paru v jednotlivych tridach
    text(t(it),g(it),num2str(ng(it)))
end
 
% vykresleni zadaneho teoretickeho variogramu
vario
dh=maxlag/100/2
h=[dh:dh:t(end)];
v=eval(vario);
subplot(2,2,4)
plot(t,g,'r.-'), hold on
xlim([0 maxlag])
title('teoreticky variogram')
plot(h,v,'k','Linewidth',2)

