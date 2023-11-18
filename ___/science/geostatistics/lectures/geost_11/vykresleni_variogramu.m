function vykresleni_variogramu

h=[0:150];
C=17; a=100;
g=C*(1-exp(-3*h/a)); % exponencialni variogram

figure
plot(h,g,'b-')