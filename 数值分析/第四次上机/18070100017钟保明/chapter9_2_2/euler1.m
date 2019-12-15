function [x,y]=euler1(f,s,y1,h)
	x=s(1):h:s(2);
	y(1)=y1;
	for n=1:length(x)-1
		y(n+1)=y(n)+h*feval(f,x(n),y(n));
	end