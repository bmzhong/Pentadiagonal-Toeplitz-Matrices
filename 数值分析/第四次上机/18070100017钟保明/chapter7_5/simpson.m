function result=simpson(x,y)
n=length(x);
if rem(n-1,2)~=0
    result=trap(x,y);
    return
end
N=(n-1)/2;
step=(x(n)-x(1))/N;
b=zeros(1,n);
for k=1:N
    b(2*k-1)=b(2*k-1)+1;
    b(2*k)=b(2*k)+4;
    b(2*k+1)=b(2*k+1)+1;
end
result=step/6*sum(b.*y);