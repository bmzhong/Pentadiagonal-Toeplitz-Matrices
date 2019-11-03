function [x_star,k]=Gline(fun,x0,x1,ep,Nmax)
if nargin<5
    Nmax=500;
end
if nargin<4
    ep=1e-5;
end
k=0;
while abs(x1-x0)>ep & k<Nmax
    k=k+1;
    x2=x1-feval(fun,x1)*(x1-x0)/(feval(fun,x1)-feval(fun,x0));
    x0=x1;
    x1=x2;
end
x_star=x1;
if k==Nmax
    warning('已达到迭代次数上限');
end