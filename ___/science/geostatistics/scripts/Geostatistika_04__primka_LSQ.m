function primka_LSQ(xd,zd,x)
% prolozeni primky metodou nejmensich ctvrecu
% primka_LSQ([1 3],[10 20],[0:.1:4])
% primka_LSQ([1 3 3.5],[10 20 30],[0:.1:4])

figure
plot(xd,zd,'r.')
hold on
grid on

nd=length(xd)

% vypocet podle vzorce z prednasky
% X je matice designu
X=[ones(1,nd);xd]';
B=inv(X'*X)*X'*zd'; % vstupni zd jsme zadali jako radkovy vektor

a=B(1)
b=B(2)

z=a+b*x;

plot(x,z,'k-')

% S=sum((zd-(a+b*xd)).^2)


