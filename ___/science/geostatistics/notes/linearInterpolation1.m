function y = linearInterpolation1(x1, y1, x2, y2, x)
    % Najde pomocí lineární interpolace hodnotu `y` pro dané `x`
    % ze dvou daných bodů (x1, y1) a (x2, y1).
    y = y1 + (y2 - y1) / (x2 - x1) * (x - x1);
end
