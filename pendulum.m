%units: length in m, time in s

clear;

x0 = 0.05
v0 = 0.02
L = 1
g = 9.81;

disp("semi-major axis")
a = x0
disp("semi-minor axis")
b = v0*sqrt(L/g) 
disp("eccentricity")
E = sqrt(1-((v0^2*L/g)/x0^2))

t = 0;
dt = 0.001;
tmax = 10;
i = 1;

hold all;

while (t<=tmax)
r = [x0*cos(sqrt(g/L)*t),v0*sqrt(L/g)*sin(sqrt(g/L)*t)];
x(i) = r(1);
y(i) = r(2);
i++;
t = t + dt;
end

plot(x,y);
