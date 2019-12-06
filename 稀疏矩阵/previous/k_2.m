function [det_T,time]=k_2(n,a,b,c,d,e,f,g)

if nargin<8||n<4||d==0
    error('输入参数不合法');
end
tic
copyd=d;
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
syms x dd;
y=-1*x/dd;
symvar(y);%函数返回的是符号函数中的自变量。
fx=matlabFunction(y); %函数f的第一个参数为d,第二个参数为x。
A=[ a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;
    ];
ta=[c;b;a;e;f;g];
t1=(1/d)*ta;
tb=[b;a;e;f;g;0];
tc=(1/d)*tb;
td=(c/d)*t1;
t2=td-tc;
if mod(n-6,2)==1
    m=n-1;
else
    m=n;
end
for i=1:(m-6)/2
    B=A(1:2,1:3);
    A(1:6,1)=[A(3:6,1);0;0]-t1*B(2,1)+t2*B(1,1);
    A(1:6,2)=[A(3:6,2);0;0]-t1*B(2,2)+t2*B(1,2);
    A(1:6,3)=[A(3:6,3);0;0]-t1*B(2,3)+t2*B(1,3);
%     A(1:4,1)=t1*fx(d,B(1,1))+B(3:6,1)+t2*fx(d,(B(2,1)+c*fx(d,B(1,1))));
%     A(1:4,2)=t1*fx(d,B(1,2))+B(3:6,2)+t2*fx(d,(B(2,2)+c*fx(d,B(1,2))));
%     A(1:4,3)=t1*fx(d,B(1,3))+B(3:6,3)+t2*fx(d,(B(2,3)+c*fx(d,B(1,3))));
%     A(5,1)=g*fx(d,B(1,1))+f*fx(d,B(2,1)+c*fx(d,B(1,1)));
%     A(5,2)=g*fx(d,B(1,2))+f*fx(d,B(2,2)+c*fx(d,B(1,2)));
%     A(5,3)=g*fx(d,B(1,3))+f*fx(d,B(2,3)+c*fx(d,B(1,3)));
%     A(6,1)=g*fx(d,B(2,1)+c*fx(d,B(1,1)));
%     A(6,2)=g*fx(d,B(2,2)+c*fx(d,B(1,2)));
%     A(6,3)=g*fx(d,B(2,3)+c*fx(d,B(1,3)));
end

if mod(n,2)==1
    ta=[c;b;a;e;f;g];
    t1=(1/d)*ta;
    B=A(1,1:3);
    A(1:6,1)=[A(2:6,1);0]-t1*B(1,1);
    A(1:6,2)=[A(2:6,2);0]-t1*B(1,2);
    A(1:6,3)=[A(2:6,3);0]-t1*B(1,3);
end
B=[d 0 0;
   c d 0;
   b c d;
   a b c;
   e a b;
   f e a;
   ];
P6=[B,A];
q=n;
w=copyd;
y=1;
while q~=0
    r=mod(q,2);
    q=floor(q/2);
    if r==1
        y=y*w;
    end
    w=w*w;
end
if mod(n,2)==0
   det_T=-y*det(P6);
end
if mod(n,2)==1
   det_T=y*det(P6);
end
time=toc;
