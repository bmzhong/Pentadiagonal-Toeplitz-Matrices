clc;clear;
n=8;%����ά��
k=3;   %  k>0
%���Խ����·�����Ϊk��Ԫ�ع��ɵ�����b1,����Ϊ(n-k)
b1=2*ones(1,n-k);
for i=1:n-k
    b1(i)=2+0.1*i;
end
%���Խ����Ϸ�����Ϊk��Ԫ�ع��ɵ�����b2,����Ϊ(n-k)
b2=3*ones(1,n-k);
for i=1:n-k
    b2(i)=3+0.1*i;
end
%���һ��Ԫ��,����Ϊn
a1=4*ones(1,n);
for i=1:n
    a1(i)=4+0.1*i;
end
%���һ��Ԫ��,����Ϊn
a2=5*ones(1,n);
for i=1:n
    a2(i)=5+0.1*i;
end
%���Խ�����Ԫ�ع��ɵ�����d������Ϊn
d=ones(1,n);
for i=1:n
    d(i)=1+0.1*i;
end


%����A����
A=diag(d,0)+diag(b1,-k)+diag(b2,k);
A(n,:)=a1;
A(:,n)=a2;
A(n,n)=d(n);

%����P����
P=zeros(n,n);
m=1;
for j=k:k:n-1
    P(j,m)=1;
    m=m+1;
end
for i=1:k-1
    for j=i:k:n-1
        P(j,m)=1;
        m=m+1;
    end
end
P(n,n)=1;
%����ȫ��Խǻ�
F=P'*A*P;

%MATLAB
tic
for cur=1:50
    res1=det(A);
end
time1=toc;
time1=time1/50;

%GAUSS ELIMINATION
time2=0;
for j=1:50
    G=A;
    tic;
    for i=1:(n-1)
        if i+k<n
            G(i+k,(i+1):n)=G(i+k,(i+1):n)-G(i+k,i)/G(i,i)*G(i,i+1:n);
            G(i+k,i)=0;
        end
        G(n,(i+1):n)=G(n,(i+1):n)-G(n,i)/G(i,i)*G(i,(i+1):(n));
        G(n,i)=0;
    end
    res2=prod(diag(G));
    time2=time2+toc;
end
time2=time2/50;

clear A G;
clear a1 a2 b1 b2 d P;
tic
for cur=1:50
    %����det(T)
    h=F(n,:);
    g=F(:,n)';
    b=diag(F,0)';
    a=[0 diag(F,-1)'];
    c=[diag(F,1)' 0];
    t=zeros(1,n);u=zeros(1,n);l=zeros(1,n);s=zeros(1,n);r=zeros(1,n);
    t(2)=b(n-1);t(3)=b(n-1)*b(n-2)-a(n-1)*c(n-2);
    u(1)=a(n);
    l(1)=c(n-1);
    s(3)=a(n-1)*c(n-2);
    for i=4:n-1
        s(i)=a(n+2-i)*c(n+1-i);
        t(i)=b(n+1-i)*t(i-1)-s(i)*t(i-2);
    end
    s(n)=a(2)*c(1);
    for i=2:n-2
        l(i)=c(n-i)*l(i-1)+(-1)^(i+1)*g(n-i)*t(i);
        r(i)=a(n+1-i)*u(i-1);
        u(i)=r(i)+(-1)^(i+1)*h(n-i)*t(i);
    end
    l(n-1)=c(1)*l(n-2)+(-1)^n*g(1)*t(n-1);
    r(n-1)=a(2)*u(n-2);
    f(1)=b(n);f(2)=b(n)*b(n-1)-a(n)*c(n-1);
    for i=3:n
        f(i)=b(n+1-i)*f(i-1)-s(i)*f(i-2)+(-1)^(i+1)*r(i-1)*g(n+1-i)...
            +(-1)^(i+1)*h(n+1-i)*l(i-1);
    end
    res3=f(n);
end
time3=toc;
time3=time3/50;
fprintf("%15.12d %15.12d\n",res1,time1);
fprintf("%15.12d %15.12d\n",res2,time2);
fprintf("%15.12d %15.12d\n",res3,time3);