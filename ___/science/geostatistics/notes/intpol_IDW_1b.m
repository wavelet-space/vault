function z = intpol_IDW_1b(xd, zd, x, a)

    % interpolace metodou IDW v 1 bode

    nd=length(xd);

    for i=1:nd
       r=abs(x-xd(i));
       if r==0
           z=zd(i);
           return
       else
           lam(i)=1/r^a;
       end
    end

    lam=lam/sum(lam);

z=lam*zd';
