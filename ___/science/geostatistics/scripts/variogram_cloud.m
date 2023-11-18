function variogram_cloud

% variogram mrak - ukazka 

[xd,yd,zd]=data_Cd; % nacteni dat

figure
subplot(2,2,1)
plot(xd,yd,'b.')
hold on
xlabel('x'), ylabel('y')
title('data positions')

subplot(2,2,2)
hold on
xlabel('h'), ylabel('d')
title('variogram cloud')
xlim([0 100])
ylim([0 60])
 
'press enter', pause
 
nd=length(xd)

for i=1:nd
    
    data_point=i % zpracovavany bod
    
    for j=i+1:nd
        h=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2) % vzdalenost mezi body
        
        subplot(2,2,1)
        plot(xd(i),yd(i),'r.','markersize',10)
        hp(j)=plot([xd(i),xd(j)],[yd(i),yd(j)],'b-');
        
        d=1/2*(zd(i)-zd(j))^2 % nepodobnost
        subplot(2,2,2)
        plot(h,d,'ko')
        
        pause(0.01)
        
    end
%     'press enter', pause
    delete(hp)
end


