function [x,y]=euler2(dyfun,x0,y0,h,N)
% N qujiangeshu
	x=zeros(1,N+1);
	y=zeros(1,N+1);
	x(1)=x0;
	y(1)=y0;
	for n=1:N
		x(n+1)=x(n)+h;
		ybar=y(n)+h*feval(dyfun,x(n),y(n));
		y(n+1)=y(n)+h/2*(feval(dyfun,x(n),y(n))+feval(dyfun,x(n+1),ybar));
	end