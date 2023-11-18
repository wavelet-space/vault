function c=kovariance(z,kmax)

% kovariance 1D ekvidistantnich dat

n=length(z)

figure
subplot(2,1,1), title('data'), hold on
plot(z,'.-')
pause

z=z-mean(z);
for k=0:kmax
    c(k+1)=sum((z(1:n-k).*z(1+k:n)))/(n-k);
end

subplot(2,1,2), title('kovariance'), hold on
plot([0:kmax],c,'g.-')



