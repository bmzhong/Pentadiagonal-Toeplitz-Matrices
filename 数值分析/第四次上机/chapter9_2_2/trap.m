function [x,y]=trap(f,x0,y0,h,n1)
	x=zeros(1,n1+1);
	y=zeros(1,n1+1);
	x(1)=x0;
	y(1)=y0;
	for n=1:n1
		x(n+1)=x(n)+h;
		z0=y(n)+h*feval(f,x(n),y(n));
		for k=1:3
			z1=y(n)+h/2*(feval(f,x(n),y(n))+feval(f,x(n+1),z0));
			if abs(z1-z0)<1e-5
				break;
			end
			z0=z1;
		end
		y(n+1)=z1;
	end