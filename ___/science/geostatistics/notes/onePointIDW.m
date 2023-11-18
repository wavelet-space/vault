 function z0 = onePointIDW(xs, zs, x0, a)
        % The inner function to calculate one point IDW.
        %
        % Input:
        %   xs, zs : x and y coordinates of surrounding points
        %   x0     : x coordinate of point
        %
        % Output:
        %   z0     : z coordinate of point
        nd = length(xs);
        ls = zeros(nd)'; 
        % ^ The lambdas (weights): prealocate for better memory managment.
        for i = 1:nd
           r = abs(x0 - xs(i));
           if r == 0 % Check if the points are the same!
               z0 = zs(i);
               return
           else
               ls(i) = 1 / r^a;
           end
        end
        
        % The weight normalization.
        %       vvvvvvvvvvvv
        z0  = (ls ./ sum(ls)) * zs'; % The scalar product!
    end