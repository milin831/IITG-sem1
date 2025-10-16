function [x,y] = RK2trapezoid(f,int,ics,m)
a = int(1); b = int(2);
u = ics(1); y0 = ics(2);
d
x = linspace(a, b, m).';
y = zeros(1, m-1);

h = (b-a)/(m-1);

[~,startIdx] = min(abs(x-u));
y(startIdx) = y0;

for k=startIdx:m-1
    k1 = h * f(x(k), y(k));
    k2 = h * f(x(k) + h, y(k) + k1);
    k3 = 0.5 * (k1+k2);
    y(k+1) = y(k) + k3;
end
end


