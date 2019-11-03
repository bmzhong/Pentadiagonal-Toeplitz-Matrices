function [x_star,k]=bisect3(fun,a,b,ep)
if nargin<4
    ep=1e-5;
end
k=1;
fa=feval(fun,a);
fb=feval(fun,b);
if fa*fb>0
    k=0;
    x_star=[a,b];
    index=0;
    return
end
while abs(b-a)/2>ep
    x=(a+b)/2;
    fx=feval(fun,x);
    if fx*fa<0
        b=x;
        fb=fx;
    elseif fx*fb<0
        a=x;
        fa=fx;
    end
    k=k+1;
end
x_star=(a+b)/2;
    