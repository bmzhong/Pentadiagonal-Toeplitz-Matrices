function result=question7_1_4(fname,a,b,n)
	step=(b-a)/n;
	fa=feval(fname, a);
	fb=feval(fname,b);
	f=feval(fname,step+a:step:b-step+0.0001*step);
	result=step*(1/2*(fa+fb)+sum(f));