function primka_U6_ukazka

% U6: zjistete, ktera primka je vhodnejsi

xd=[0 1 2]
zd=[0 2 1]

x=[-1:0.1:4];


figure
plot(xd,zd,'ko')
hold on
axis equal
grid on
xlabel('x')

'modra primka'
a=0
b=1
z=a+b*x;
plot(x,z,'b-','linewidth',2)
S_modra=sum((zd-(a+b*xd)).^2) % suma ctvrecu rezidui

'cervena primka'
a=1/2
b=1/2
z=a+b*x;
plot(x,z,'r-','linewidth',2)
S_cervena=sum((zd-(a+b*xd)).^2) % suma ctvrecu rezidui

'stiskni enter'
pause

%  zvolime sit ruznych hodnot parametru a,b
[Ag,Bg]=meshgrid([-1:0.1:2],[-1:0.1:2]);
[M,N]=size(Ag)

for i=1:M
    for j=1:N
    
    a=Ag(i,j);
    b=Bg(i,j);
    
    z=a+b*x;
    S(i,j)=sum((zd-(a+b*xd)).^2);
    end
    
end


min_S=min(S(:)) % minimum plochy

figure
hold on
xlabel('a'), ylabel('b'), zlabel('S(a,b)')
surf(Ag,Bg,S)
grid on
view(-25,10)
alpha(0.3)



% vykresleni obou pripadu ze zadani U6
a=0; b=1;
plot3([a a],[b b],[0 S_modra],'b-','linewidth',2)
a=1/2; b=1/2; 
plot3([a a],[b b],[0 S_cervena],'r-','linewidth',2)






