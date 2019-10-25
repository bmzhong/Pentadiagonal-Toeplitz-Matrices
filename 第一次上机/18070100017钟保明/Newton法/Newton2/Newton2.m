function [x_star,index,k]=Newton2(fun,x0,ep,Nmax)
if nargin<4
    Nmax=500;
end
if nargin<3
    ep=1e-5;
end
index=0;
x1=x0;
x=sym('x');
dfun=diff(fun,x,1);
k=1;
while k<Nmax
    x0=x1;
    fx0=subs(fun,x,x0);
    dfx0=subs(dfun,x,x0);
    if abs(dfx0)<ep
        break;
    end
    x1=x1-fx0/dfx0;
    if abs(x0-x1)<ep
        index=1;
        break;
    end
    k=k+1;
end
x_star=x1;
if k==Nmax
    warning('已达到迭代次数上限');
end