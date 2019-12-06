function [det_T,time]=sparse3(n,k,a,b,c,d,e,f,g)
if nargin<8||n<4||d==0
    error('输入参数不合法');
end
tic
d1=d;%用于后面计算行列式前的d^(n-6)
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
t=[c;b;a;e;f;g];
D=[d 0 0;
    c d 0;
    b c d;
    a b c;
    e a b;
    f e a;
    ];
A=[a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;];
coe3=[-c 1 0 0 0 0;
    -b 0 1 0 0 0;
    -a 0 0 1 0 0;
    -e 0 0 0 1 0;
    -f 0 0 0 0 1;
    -g 0 0 0 0 0;];

coe3=coe3^k;
q=floor((n-6)/k);
r=mod(n-6,k);
for i=1:q
    B1=A;
    A=coe3*B1;
end
for i=1:r
    B2=A(1,1:3);
    A(1:6,1)=[A(2:6,1);0]-t*B2(1,1);
    A(1:6,2)=[A(2:6,2);0]-t*B2(1,2);
    A(1:6,3)=[A(2:6,3);0]-t*B2(1,3);
end
u=n;
w=d1;
y=1;
while u~=0
    r1=mod(u,2);
    u=floor(u/2);
    if r1==1
        y=y*w;
    end
    w=w*w;
end
P6=[D,A];
if mod(n,2)==0
    det_T=-y*det(P6);
end
if mod(n,2)==1
    det_T=y*det(P6);
end
time=toc;
