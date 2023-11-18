function variogram_2D(hmax,dh)

% variogram plosnych (2D) dat vyrobeny z funkce variogram mrak

[xd,yd,zd]=data_Cd

figure
subplot(2,2,1)
plot(xd,yd,'b.')
hold on
xlabel('x'), ylabel('y')
title('positions of data points')

subplot(2,2,2)
hold on
xlabel('h'), ylabel('d')
title('variogram cloud')
xlim([0 100])
ylim([0 60])
% pause

nd=length(xd)

kmax=hmax/dh
g=zeros(1,kmax);
ng=zeros(1,kmax);
for i=1:nd
    for j=i+1:nd
        h=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2);
        
        if h<hmax
            d=1/2*(zd(i)-zd(j))^2;
            subplot(2,2,2)
            plot(h,d,'ko')
            
            k=fix(h/dh)+1;
            g(k)=g(k)+d;
            ng(k)=ng(k)+1;         
        end
    end
end
g
ng

h=[1:kmax]*dh-dh/2
g=g./ng
plot(h,g,'r.-')

subplot(2,2,3)
xlabel('h'), ylabel('\gamma'), hold on
title('experimental variogram')
plot(h,g,'r.-')

for i=1:kmax
    text(h(i),g(i),num2str(ng(i)))
end




