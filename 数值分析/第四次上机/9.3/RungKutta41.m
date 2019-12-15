function [x,y]=RungKutta41(dyfun,x0,y0,h,N)
	x=zeros(1,N+1);
	y=zeros(1,N+1);
	x(1)=x0;
	y(1)=y0;
	for n=1:N
		x(n+1)=x(n)+h;
		k1=h*feval(dyfun,x(n),y(n));
		k2=h*feval(dyfun,x(n)+h/2,y(n)+1/2*k1);
		k3=h*feval(dyfun,x(n)+h/2,y(n)+1/2*k2);
		k4=h*feval(dyfun,x(n)+h,y(n)+k3);
		y(n+1)=y(n)+(k1+2*k2+2*k3+k4)/6;
	end