function z=intpol_IDW_2D_1b(xd,yd,zd,x,y,a)

% interpolace metodou IDW v 1 bode

nd=length(xd);

for i=1:nd
   r=sqrt((x-xd(i))^2+(y-yd(i))^2);
   if r==0
       z=zd(i);
       return
   else
       lam(i)=1/r^a;
   end
end

lam=lam/sum(lam);

z=lam*zd';



