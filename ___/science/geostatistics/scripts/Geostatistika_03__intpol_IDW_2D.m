function intpol_IDW_2D(xd,yd,zd,x,y,a)

% interpolace metodou IDW ve vice bodech

figure
plot3(xd,yd,zd,'o')
hold on

nd=length(xd)

[Xg,Yg]=meshgrid(x,y);

x=Xg(:);
y=Yg(:);


n=length(x)

for i=1:n
    z(i)=intpol_IDW_2D_1b(xd,yd,zd,x(i),y(i),a);
%     plot3(x(i),y(i),z(i),'r.')
%     pause(0.1)
end

Zg=reshape(z,size(Xg));
surf(Xg,Yg,Zg)
grid on


