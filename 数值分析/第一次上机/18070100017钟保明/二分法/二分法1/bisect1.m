function [x_star,k]=bisect1(fun,a,b,ep)
if nargin<4
    ep=1e-5;
end
fa=feval(fun,a);
fb=feval(fun,b);
k=1;
if fa*fb>0
    k=0;
    x_star=[fa,fb];
    return
end
while abs(b-a)/2>ep
    k=k+1;
    x=(a+b)/2;
    fx=feval(fun,x);
    if fx*fa<0
        b=x;
        fb=fx;
    elseif fx*fb<0
        a=x;
        fa=fx;
    elseif fx==0
        break
    end
end
x_star=(a+b)/2;
