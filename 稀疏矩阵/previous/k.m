function [det_T,time]=k(n,a,b,c,d,e,f,g)

if nargin<8||n<4||d==0
    error('输入参数不合法');
end
tic
syms x dd;
y=-1*x/dd;
symvar(y);%函数返回的是符号函数中的自变量。
fx=matlabFunction(y); %函数f的第一个参数为dd,第二个参数为x。
A=[ a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;
    ];
ta=[c;b;a;e;f;g];
t1=(1/d)*ta;
for i=1:n-6
    B=A(1,1:3);
    A(1:6,1)=[A(2:6,1);0]-t1*B(1,1);
    A(1:6,2)=[A(2:6,2);0]-t1*B(1,2);
    A(1:6,3)=[A(2:6,3);0]-t1*B(1,3);
end
B=[ d 0 0;
    c d 0;
    b c d;
    a b c;
    e a b;
    f e a;
    ];
P6=[B,A];
% disp(P6);
% P1=det(P6);
% disp(P1);
q=n-6;
w=d;y=1;
while q~=0
    r=mod(q,2);
    q=floor(q/2);
    if r==1
        y=y*w;
    end
    w=w*w;
end
det_T=y*det(P6);
if mod(n,2)==0
   det_T=-y*det(P6);
end
if mod(n,2)==1
   det_T=y*det(P6);
end
time=toc;
