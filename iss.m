%units: lenght in m, time in s, mass in kg

h = 400*10^3;
E = 6371*10^3;
m = 5.9736*10^24;
G = 6.67384*10^(-11);
s = 7770;	%initial speed
dt = 0.1;
n = 10000;	%number of steps, calulation could take a while for n>1000


r = [E+h;0]
v = [0;s]
l = norm (r)	%length of vector r
a = -G*m/(l^2)*r/l 	%r/l is vector of length 1 and direction of vector r
x = r(1);
y = r(2);
plot (x,y,"x","markersize",15,"markerfacecolor","red") 		%marks initial point
hold all

for i = 1:n
	l = norm (r);
	a = -G*m/(l^2)*r/l;
	v = v+a*dt;
	r = r+v*dt;
	x = r(1);
	y = r(2);
	plot (x,y,".b","markersize",5)
end



