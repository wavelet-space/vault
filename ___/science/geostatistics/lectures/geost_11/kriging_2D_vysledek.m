function kriging_2D_vysledek(xd,yd,zd,x,y) %z
% kriging 2D dat  %z 
% nacteni dat: [xd,yd,zd]=data_Cd
% spusteni fce: kriging_2D_vysledek(xd,yd,zd,[250:5:500],[100:5:350])
figure
plot3(xd,yd,zd,'o') %z
hold on

nd=length(xd)

% vytvoreni gridu
[Xg,Yg]=meshgrid(x,y);
x=Xg(:);
y=Yg(:);
n=length(x)


for k=1:n
    % potrebne vzdalenosti
    for i=1:nd
        for j=1:nd 
            h(i,j)=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2); %z
        end
        hb(i)=sqrt((x(k)-xd(i))^2+(y(k)-yd(i))^2); %z
    end

    G=2*h; % linearni variogram (leva strana soustavy)
    Gb=2*hb; % linearni variogram (prava strana soustavy)
    
    % leva a prava strana soustavy krigingu
    L=[G ones(nd,1);
        ones(1,nd) 0];
    P=[Gb 1]';
    
    % reseni soustavy krigingu
    X=inv(L)*P;
    lam=X(1:nd)';
    
    z(k)=lam*zd';
%     plot3(x(k),y(k),z(k),'r.') %z
%     pause(0.01)
end

% plot(x,z,'r-') %z

% preformatovani vektoru z do matice a vykresleni
Zg=reshape(z,size(Xg));
surf(Xg,Yg,Zg)
grid on