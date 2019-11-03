function [l,u]=lu_Doolittle1(A)
n=length(A);
u=zeros(n);
l=eye(n);
u(1,:)=A(1,:);
l(2:n,1)=A(2:n,1)/u(1,1);
for k=2:n
    u(k,k:n)=A(k,k:n)-l(k,1:k-1)*u(1:k-1,k:n);
    l(k+1:n,k)=(A(k+1:n,k)-l(k+1:n,1:k-1)*u(1:k-1,k))/u(k,k);
end
A