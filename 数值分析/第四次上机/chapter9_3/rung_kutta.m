function [x,y]=rung_kutta(f,x0,y0,h,n1)
	x=zeros(1,n1+1);
	y=zeros(1,n1+1);
	x(1)=x0;
	y(1)=y0;
	for n=1:n1
		x(n+1)=x(n)+h;
		k1=h*feval(f,x(n),y(n));
		k2=h*feval(f,x(n)+h/2,y(n)+1/2*k1);
		k3=h*feval(f,x(n)+h/2,y(n)+1/2*k2);
		k4=h*feval(f,x(n)+h,y(n)+k3);
		y(n+1)=y(n)+(k1+2*k2+2*k3+k4)/6;
	end