function result=trap(x,y)
n=length(x);
h=(x(n)-x(1))/(n-1);
a=[1 2*ones(1,n-2) 1];
result=h/2*sum(a.*y);