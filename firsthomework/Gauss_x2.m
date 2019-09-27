function x=Gauss_x2(A,b)
n=length(b);
A=[A';b]';
for k=1:(n-1)
    [ap,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    if p>k
        t=A(k,:);
        A(k,:)=A(p,:);
        A(p,:)=t;
    end
    A((k+1):n,(k+1):(n+1))=A((k+1):n,(k+1):(n+1))-A((k+1):n,k)/A(k,k)*A(k,(k+1):(n+1));
    A((k+1):n,k)=zeros(n-k,1);
    A
end
x=zeros(n,1);
x(n)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
    x(k,:)=(A(k,n+1)-A(k,(k+1):n)*x((k+1):n))/A(k,k);
end
