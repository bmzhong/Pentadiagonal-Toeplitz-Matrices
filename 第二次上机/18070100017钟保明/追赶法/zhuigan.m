function X=zhuigan(A,B,C,D)
n=length(B);
X=zeros(1,n);
U=zeros(1,n);
Q=zeros(1,n);
U(1)=C(1)/B(1);
Q(1)=D(1)/B(1);
for i=2:n-1
    U(i)=C(i)/(B(i)-U(i-1)*A(i-1));
end
for i=2:n
    Q(i)=(D(i)-Q(i-1)*A(i-1))/(B(i)-U(i-1)*A(i-1));
end
X(n)=Q(n);
for i=n-1:-1:1
    X(i)=Q(i)-U(i)*X(i+1);
end