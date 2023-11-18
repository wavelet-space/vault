function [xd,zd,name]=data_index_stari
% scitani 2011
% POCET_OBYV(i) > 50000 & POCET_OBYV(i) < 200000
% Praha = [0,0] km

xd =[-82.8996,-53.0006,-23.8841,-20.9401,-16.4405, 51.4710, 70.2025, 91.7604, 99.6886,194.3976,219.1309 243.1492,271.1254,280.1062,287.0516];

zd =[141.8103, 98.7045,118.2299,100.1859,127.6622,107.3369,118.4577,142.7892,151.9617,121.3729,138.6561,112.3691,103.5567,129.2123,131.9843];

name = {'Plzen','Most','Kladno','Usti nad Labem','Ceske Budejovice','Liberec','Jihlava','Pardubice','Hradec Kralove','Olomouc','Zlin','Opava','Frydek-Mistek','Havirov','Karvina'};

figure, hold on
plot(xd,zd,'bo')
nd=length(xd);
for i=1:nd
    text(xd(i)+5,zd(i),name(i))
end
xlabel('x')
ylabel('index')
