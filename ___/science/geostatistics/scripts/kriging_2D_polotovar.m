function kriging(xd,zd,x) %z

% kriging 1D dat  %z

figure
plot(xd,zd,'o') %z
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
            h(i,j)=abs(xd(i)-xd(j)); %z
        end
        hb(i)=abs(x(k)-xd(i)); %z
    end

    G=h; % linearni variogram (leva strana soustavy)
    Gb=hb; % linearni variogram (prava strana soustavy)
    
    % leva a prava strana soustavy krigingu
    L=[G ones(nd,1);
        ones(1,nd) 0];
    P=[Gb 1]';
    
    % reseni soustavy krigingu
    X=inv(L)*P;
    lam=X(1:nd)';
    
    z(k)=lam*zd';
    plot(x(k),z(k),'r.') %z
    pause(0.01) %z
end

plot(x,z,'r-') %z

% preformatovani vektoru z do matice a vykresleni
Zg=reshape(z,size(Xg));
surf(Xg,Yg,Zg)
grid on