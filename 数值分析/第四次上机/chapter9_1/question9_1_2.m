function [r2,t2]=question9_1_2(f,s,y0,h)
	r2=s(1):h:s(2);
	t2(1)=y0;
	for n=1:length(r2)-1
		t2(n+1)=t2(n)+h*feval(f,r2(n));
	end
	r2=r2';
	t2=t2';