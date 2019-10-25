function [x_star,k]=bisect2(fname,a,b,ep)
fa=feval(fname,a);
fb=feval(fname,b);
k=1;
if nargin<4
    ep=1e-5;
end
if fa*fb>0
    error('���������˱������');
end
x=(a+b)/2;
while(b-a)>2*ep
    fx=feval(fname,x);
    if fx*fa<0
        b=x;
        fb=fx;
    elseif fx*fb<0
        a=x;
        fa=fx;
    end
    x=(a+b)/2;
    k=k+1;
end
x_star=(a+b)/2;
    