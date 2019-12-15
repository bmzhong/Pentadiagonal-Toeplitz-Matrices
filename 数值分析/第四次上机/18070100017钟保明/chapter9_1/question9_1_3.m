function [r3,t3]=question9_1_3(f,s,y1,h)
	r3=s(1):h:s(2);
	t3(1)=y1;
	for n=1:length(r3)-1
		t3(n+1)=t3(n)+h*feval(f,r3(n),t3(n));
	end