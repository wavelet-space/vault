function z=randwalk
% nahodna prochazka

figure
xlim([0 100]), ylim([-15 15]), hold on

z(1)=0;
for i=2:100
    z(i)=z(i-1)+randn;
    plot([i-1 i],[z(i-1) z(i)],'k.-'), hold on
    %pause
end
