function [x_star,k]=Newton1(fname,dfname,x0,ep,Nmax)
digits(7);
if nargin<4
    ep=1e-5;
end
if nargin<5
    Nmax=500;
end
k=0;
x=x0;
x0=x+2*ep;
while abs(x-x0)>ep&k<Nmax
    x0=x;
    x=x0-feval(fname,x0)/feval(dfname,x0);
    k=k+1;
end
x_star=x;
if k==Nmax
    warning('已达到迭代次数上限');
end
    