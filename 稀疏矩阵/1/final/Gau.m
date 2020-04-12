function [r,time]=Gau(n,a,b,c,d,e,f,g)
tic
r=1;
A=[ a b c d 0 0 0;
    e a b c d 0 0 ;
    f e a b c d 0 ;
    g f e a b c d;];
for j=1:n-7
    r=r*A(1,1);
    A(2,2:7)=A(2,2:7)-(A(2,1)/A(1,1))*A(1,2:7);
    A(3,2:7)=A(3,2:7)-(A(3,1)/A(1,1))*A(1,2:7);
    A(4,2:7)=A(4,2:7)-(A(4,1)/A(1,1))*A(1,2:7);
    row=[g f e a b c d];
    zer=zeros(3,1);
    M=[A(2:4,2:7)  zer];
    A=[M;row];
end
r=r*A(1,1);
B=[A;
    0 g f e a b c;
    0 0 g f e a b;
    0 0 0 g f e a;];
for k=1:6
    B((k+1):7,(k+1):7)=B((k+1):7,(k+1):7)-B((k+1):7,k)/B(k,k)*B(k,(k+1):7);
    B((k+1):7,k)=zeros(7-k,1);
    r=r*B(k+1,k+1);
end
time=toc;


