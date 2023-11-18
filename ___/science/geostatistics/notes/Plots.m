function Plots
% FUNCTION Funkce vykreslí sinus a cosinus.

close all; format compact; 

x = (0: .1 : 3*pi);

y = sin(x);
z = cos(x);

plot(x, y, 'r.-');

hold on, pause(1)

for i = 1:length(x)
    plot(x(i), z(i), 'b.-');
    pause(0.1)
end

