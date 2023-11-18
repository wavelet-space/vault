function [xd,yd,zd]=ukazka_SGS

% Zjednodusena ukazka sekvencni gaussovske simulace 
% vyrobena z funkce kriging_2D_vysledek_exp (prevzali jsme tam variogram 
% a podstatnou cast kodu provadejici kriging).

% Spusteni funkce: [xd,yd,zd]=ukazka_SGS;
% po spusteni funkce se do pracovniho prostoru Matlabu zapisi data xd,yd,zd.

format compact

% prvni bod zvolime
xd(1)=375 % zhruba uprostred oblasti, kde lezi data Cd
yd(1)=225
zd=8 % hodnota blizka prumeru Cd

nsim=100 % pocet kroku simulace

figure
plot3(xd,yd,zd,'mx')
hold on
grid on

'vykreslen je prvni bod'
'po zmacknuti ENTER se vygeneruje 60 hodnot (~Cd)'
pause

for k=1:nsim % simulacni cyklus
    nd=length(xd) % aktualni pocet dat (na zacatku je 1, pak se zvetsuje)
    
    x=250+rand*250; % nahodne zvoleny dalsi bod v oblasti
    y=110+rand*220;
    
    % potrebne vzdalenosti a odpovidajici variogramy
    for i=1:nd
        for j=1:nd
            h(i,j)=sqrt((xd(i)-xd(j))^2+(yd(i)-yd(j))^2);
        end
        hb(i)=sqrt((x-xd(i))^2+(y-yd(i))^2);
    end
    C=17; a=100; % exponencialni variogram pouzity pro data Cd
    G=C*(1-exp(-3*h/a)); 
    Gb=C*(1-exp(-3*hb/a));
    
    % reseni krigingu prevzate z funkce kriging_2D_vysledek_exp 
    % leva a prava strana soustavy krigingu
    L=[G ones(nd,1);
        ones(1,nd) 0];
    P=[Gb 1]';
    
    % reseni soustavy krigingu
    X=inv(L)*P;
    lam=X(1:nd)';
    z=lam*zd';
    
    % ---
    % toto ve fci kriging_2D_vysledek_exp nebylo
    miL=X(nd+1); % Lagrangeuv multiplikator je v posledni hodnote X
    s2k=lam*Gb'+miL; % rozptyl krigingu podle vzorce (8.6) GPI
    sk=sqrt(s2k) % chyba krigingu (smerodatna odchylka, tedy odmocnina)
    
    % k hodnote vypoctene krigingem se prida nahodna slozka
    % je to nahodna hodnota z rozdeleni N(0,s2k)
    % coz udelame jako hodnota generovana z N(0,1)*chyba krigingu
    z=z+randn*sk; % tim jsme vygenerovali dalsi datovou hodnotu, ktera je 
    % s prechozimi daty provazana prostrednictvim pouziteho variogramu
    % ---
    
    plot3(x,y,z,'bo')
    
    % aktualne vypoctene x,y,z pridame do datoveho souboru. pocet dat 
    % se zvetsi o 1 a pujdeme na dalsi krok cyklu
    xd(k)=x;
    yd(k)=y;
    zd(k)=z;
    pause(0.01)
end

'konec simulace, nova data jsou vygerovana :)'