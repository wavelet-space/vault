function polynom_lokalni(xd,zd,x,h)

% prolozeni polynomu metodou vazenych nejmensich ctvrecu

figure
plot(xd,zd,'o')
hold on

nd=length(xd) % pocet dat

n=length(x) % pocet bodu, kde interpolujeme

for i=1:n % cyklus pres vsechny pozadovane body
    
    x(i) % bod, kde prave pocitame
    
    % regresni matice
    X=[ones(1,nd);xd;xd.^2]';
    
    % vypocet vah
    for j=1:nd 
        d=abs(x(i)-xd(j));
        w(j)=exp(-(d/h)^2); % gaussovske vahy
    end
    W=diag(w);

    % vektor koeficientu polynomu
    B=inv(X'*W*X)*X'*W*zd'; % zd jsme zadali jako radkovy vektor
    
%     H=X*inv(X'*X)*X'
%     diag(H)
%     SH(i)=sum(diag(H))
%     trace(H)

    a=B(1);
    b=B(2);
    c=B(3);
    
    z(i)=a+b*x(i)+c*x(i).^2;
    
    plot(x(i),z(i),'b.')
       
    pause(0.01)
    
end

plot(x,z,'b-') % zaverecne vykresleni plnou carou
