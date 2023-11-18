% Reseni linearni algebraicke soustavy A.x=b operatorem \ a funkci linsolve

format long; format compact

nmax=10000
% A=[0 1;1 0];
% b=[1;1];
A=rand(nmax);
b=ones(nmax,1);

tic; x=A\b; toc
x(1:3)'   % zacatek vektoru reseni
A*x;
ans(1:3)' % zkouska

tic; x=linsolve(A,b); toc  % lze obecneji: linsolve(A,b,opts)
x(1:3)'   % zacatek vektoru reseni
A*x;
ans(1:3)' % zkouska
