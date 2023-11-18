function intpol_IDW_2D_CV(xd,yd,zd,x,y,a)
% interpolace metodou IDW ve vice bodech - ukazaka CV
% intpol_IDW_2D_CV(xd,yd,zd,[0:0.2:7],[0:0.2:7],2)

figure
plot3(xd,yd,zd,'b.','markersize',12)
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
view(-125,30)
pause(1)
alpha(0.2)

% -------------------------------------------------------------------------
% cross-validation

title('cross-valiation')

for i=1:nd
    ind=setdiff([1:nd],i);
    zcv(i)=intpol_IDW_2D_1b(xd(ind),yd(ind),zd(ind),xd(i),yd(i),a);
    e(i)=zd(i)-zcv(i);
    plot3(xd(i),yd(i),zcv(i),'r.','markersize',12)
    plot3([xd(i) xd(i)],[yd(i) yd(i)],[zd(i) zcv(i)],'r-')
    pause(0.1)
end




