function zs=wma(z,w)

% vazeny klouzavy prumer
% w... vahy, predp. lichy pocet, suma=1

nw=length(w)
k=(nw-1)/2
n=length(z)
zs=mean(z)*ones(1,n);
for i=1+k:n-k
    zs(i)=sum(w.*z(i-k:i+k));
end

figure

subplot(2,1,1)
plot(z,'b.-')
title('data')

subplot(2,1,2)
plot(z,'c.-')
hold on
plot(zs,'b.-')
title('vazeny klouzavy prumer')