function polynom_LSQ(xd,zd,x)
% prolozeni polynomu metodou nejmensich ctvrecu
% polynom_LSQ([1 3 3.5],[10 20 30],[0:.1:4])
% polynom_LSQ([1 3 3.2 3.5],[10 20 30 30],[0:.1:4])

figure
plot(xd,zd,'o')
hold on
grid on

nd=length(xd)

% vypocet podle vzorce z prednasky
% X je matice designu
X=[ones(1,nd);xd;xd.^2]'
B=inv(X'*X)*X'*zd' % vstupni zd jsme zadali jako radkovy vektor

a=B(1)
b=B(2)
c=B(3)

z=a+b*x+c*x.^2;

plot(x,z,'k.-')

% S=sum((zd-(a+b*xd+c*xd.^2).^2))
