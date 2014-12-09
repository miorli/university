clear;

global r = [1,0,1,;-1,0,-1;-1/2,0,1/2;1/2,0,-1/2]               %rows of matrix are coordinates of each individual point mass

global m = [1,1,1,1]	                                        %entries are masses of each individual point mass

if rows(r) != columns(m)
	disp("WARRNING!")
	disp("Number of coordinates must match number of point masses")
	break;
endif

d=0;
i=0;
j=0;

function d = kronDel(i,j)
	if i == j
		d = 1;
	else
		d = 0;
	end
endfunction

function T = inertia(i,j)
	global r
	global m
	T=0;
	
	for k = 1:rows(r)
		T = T + m(1)*(norm(r(1,:))^2*kronDel(i,j)-r(k,i)*r(k,j));
	endfor
endfunction

I = [inertia(1,1), inertia(1,2), inertia(1,3); inertia(2,1), inertia(2,2), inertia(2,3); inertia(3,1), inertia(3,2), inertia(3,3) ]

disp("eigenvectors")
[v, lambda] = eig (I)

hold all;
axis("equal")

for k = 1:3
	quiver3(0,0,0,v(1,k),v(2,k),v(3,k))
endfor

for k = 1:rows(r)
	plot3(r(k,1), r(k,2), r(k,3),'.','MarkerSize',m(k)*10)      %marker sizes represent mass of point masses
endfor
