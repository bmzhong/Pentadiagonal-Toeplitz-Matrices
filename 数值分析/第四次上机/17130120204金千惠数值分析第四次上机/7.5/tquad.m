function I=tquad(x,y)
n=length(x);
m=length(y);
if n~=m
    error('向量x,y的长度必须一致');
end
h=(x(n)-x(1))/(n-1);
a=[1 2*ones(1,n-2) 1];
I=h/2*sum(a.*y);