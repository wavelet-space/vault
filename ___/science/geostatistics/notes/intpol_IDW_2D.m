function z = intpol_IDW_2D(xd, yd, zd, x, a)

    % interpolace metodou IDW ve vice bodech

    figure;
    plot3(xd,yd, zd,'o');
    hold on;

    n = length(x);

    for i=1:n
        z(i)=intpol_IDW_2D_1b(xd, yd, zd, x(i), y(i), a);
        plot( x(i), z(i), 'r.');
        pause(0.1);
    end

    plot3(x,z,'r-');
    