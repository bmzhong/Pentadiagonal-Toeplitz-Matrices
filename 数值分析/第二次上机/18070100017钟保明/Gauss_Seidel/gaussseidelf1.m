function [x,k]=gaussseidelf1(A,b,x0,ep,Nmax)
n=length(A);
k=0;
if nargin<5 
    Nmax=500;
end
if nargin<4
    ep=1e-5;
end
if nargin<3
    x0=zeros(n,1);
end
x=x0;
x0=x+2*ep;
while norm(x0-x,inf)>ep&&k<Nmax
    k=k+1;
    x0=x;
    y=x;
    for i=1:n
        z(i)=b(i);
        for j=1:n
            if j~=i
                z(i)=z(i)-A(i,j)*x(j);
            end
        end
        if abs(A(i,i))<1e-10||k==Nmax
            waring('A(i,i)太小');
            return 
        end
            z(i)=z(i)/A(i,i);
            x(i)=z(i);
    end
end
if k==Nmax 
     warning('已经达到迭代次数上限');
end
    