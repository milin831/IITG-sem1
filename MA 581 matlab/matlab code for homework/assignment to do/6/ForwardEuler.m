function [x,y] = ForwardEuler(f,int,ics,m)
a = int(1); b = int(2);
u = ics(1); y0 = ics(2);

x = linspace(a, b, m).';
y = zeros(1, m-1);

h = (b-a)/(m-1);

[~,startIdx] = min(abs(x-u));
y(startIdx) = y0;

for k = startIdx:m-1
    y(k+1) = y(k) + h * f(x(k), y(k));
end
end


