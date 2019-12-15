function [x,y]=adjust(f,s,y0,h)
	x=s(1):h:s(2);
	y(1)=y0;
	for n=1:length(x)-1
		k1=h*feval(f,x(n),y(n));
		k2=h*feval(f,x(n)+h,y(n)+k1);
		y(n+1)=y(n)+1/2*k1+1/2*k2;
	end