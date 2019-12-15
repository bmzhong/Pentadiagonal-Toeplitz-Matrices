function [x,y]=euler2(f,x1,y1,h,n1)
	x=zeros(1,n1+1);
	y=zeros(1,n1+1);
	x(1)=x1;
	y(1)=y1;
	for n=1:n1
		x(n+1)=x(n)+h;
		ybar=y(n)+h*feval(f,x(n),y(n));
		y(n+1)=y(n)+h/2*(feval(f,x(n),y(n))+feval(f,x(n+1),ybar));
	end