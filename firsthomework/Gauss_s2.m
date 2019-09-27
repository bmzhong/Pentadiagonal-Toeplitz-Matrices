function x=Gauss_s2(A,b)
A=[A';b]',n=length(b);
for k=1:n-1
    for i=k+1:n
        m=A(i,k)/A(k,k);
        fprintf('m%d%d = %f\n',i,k,m);
        for j=k:n+1
            A(i,j)=A(i,j)-m*A(k,j);
        end
    end
    fprintf('A%d = \n',k+1);
    A
end
A(n,n+1)=A(n,n+1)/A(n,n);
for i=n-1:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*A(j,n+1);
    end
    A(i,n+1)=(A(i,n+1)-s)/A(i,i);
end
x=A(:,n+1);