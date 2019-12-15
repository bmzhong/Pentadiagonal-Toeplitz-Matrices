function [x,y]=euler1(dyfun,xspan,y0,h)
% h buchang
% xspan qiujiequjian
	x=xspan(1):h:xspan(2);
	y(1)=y0;
	for n=1:length(x)-1
		y(n+1)=y(n)+h*feval(dyfun,x(n));
	end
	x=x';
	y=y';