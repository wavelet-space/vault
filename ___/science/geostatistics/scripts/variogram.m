function g = variogram(z,kmax)

% variogram 1D ekvidistantnich dat

n=length(z)

figure
subplot(2,1,1), title('data'), hold on
plot(z,'.-')
pause

for k=0:kmax
    g(k+1)=sum((z(1:n-k)-z(1+k:n)).^2)/2/(n-k);
end

subplot(2,1,2), title('variogram'), hold on
plot([0:kmax],g,'r.-')