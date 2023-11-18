function z = intpol_IDW(xd, zd, x, a)

    % interpolace metodou IDW ve vice bodech

    figure;
    plot(xd,zd,'o');
    hold on;

    n = length(x);

    for i=1:n
        z(i)=intpol_IDW_1b(xd,zd,x(i),a);
        plot(x(i),z(i),'r.');
        pause(0.1);
    end

    plot(x,z,'r-');
    
end