function [res1,res2,time1,time2]=GBkTCOPY(n)
% n=18000;%矩阵维数
k=3;   %  k>0
%主对角线下方距离为k的元素构成的向量b1,长度为(n-k)
b1=ones(1,n-k);
% for i=1:n-k
%     b1(i)=1;
% end
%主对角线上方距离为k的元素构成的向量b2,长度为(n-k)
b2=ones(1,n-k);
% for i=1:n-k
%     b2(i)=1;
% end
%最后一行元素,长度为n
a1=2*ones(1,n);
% for i=1:n-1
%     a1(i)=2;
% end
%最后一列元素,长度为n
a2=-2*zeros(1,n);
% for i=1:n-1
%     a2(i)=-2;
% end
%主对角线上元素构成的向量d，长度为n
d=ones(1,n);
for i=1:n
    d(i)=1.5+(k/n)^2;
end
%构造A矩阵
A=diag(d,0)+diag(b1,-k)+diag(b2,k);
A(n,:)=a1;
A(:,n)=a2;
A(n,n)=d(n);
%构造P矩阵
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
%不完全块对角化
F=P'*A*P;
tic
for cur=1:50
    res1=det(A);
end
time1=toc;
time1=time1/50;
clear A;
clear a1 a2 b1 b2 d P;
tic
for cur=1:50
    %计算det(T)
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
    res2=f(n);
end
time2=toc;
time2=time2/50;
clear a b c g h F t u s l r f;
% fprintf("PAPER:     行列式值 %15.12d",res2);
% fprintf("           计算时间:  %15.12d\n",time2);
% fprintf("MATLAB:    行列式值 %15.12d",res1);
% fprintf("           计算时间： %15.12d\n",time1);