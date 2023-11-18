function ys = linearInterpolationN(x1, y1, x2, y2, xs)
    % Inputs:
    %   x1, y1 : zadaná souřadnice prvního bodu
    %   x2, y2 : zadaná souřadnice druhého bodu
    %   xs     : seznam souřadnic v intervalu (x1, x2)
    %
    % Outputs:
    %   zs : spočtené hodnoty pro interval (x1, x2)    
    n = length(xs);
    ys = zeros(n);
    for i = 1:n
        ys(i) = linearInterpolation1(x1, y1, x2, y2, xs(i));
    end
end