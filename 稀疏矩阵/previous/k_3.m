function [det_T,time]=k_3(n,a,b,c,d,e,f,g)
if nargin<8||n<4||d==0
    error('输入参数不合法');
end
tic
copyd=d;
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
A=[a b c;
   e a b;
   f e a;
   g f e;
   0 g f;
   0 0 g;
  ];
ta=[c;b;a];
t1=(1/d)*ta;
tb=[b;a;e];
t2=(c/d)*t1-(1/d)*tb;
tc=[a;e;f];
t3=(c/d)*t2-(b/d)*t1+(1/d)*tc;
td=[e;f;g];
t4=(1/d)*td;
te=(c/d)*t4;
tf=[f;g;0];
tg=(1/d)*tf;
t5=te-tg;
th=(c/d)*t5;
ti=(b/d^2)*td;
tj=[g/d;0;0];
t6=th-ti+tj;
if mod(n-6,3)==0
    m=n;
elseif mod(n-6,3)==1
    m=n-1;
elseif mod(n-6,3)==2
    m=n-2;
end
for i=1:(m-6)/3
    B=A(1:3,1:3);
    A(1:3,1)=A(4:6,1)-t1*B(3,1)+t2*B(2,1)-t3*B(1,1);
    A(1:3,2)=A(4:6,2)-t1*B(3,2)+t2*B(2,2)-t3*B(1,2);
    A(1:3,3)=A(4:6,3)-t1*B(3,3)+t2*B(2,3)-t3*B(1,3);
    A(4:6,1)=-t4*B(3,1)+t5*B(2,1)-t6*B(1,1);
    A(4:6,2)=-t4*B(3,2)+t5*B(2,2)-t6*B(1,2);
    A(4:6,3)=-t4*B(3,3)+t5*B(2,3)-t6*B(1,3);
end
if mod(n-6,3)==1
    ta=[c;b;a;e;f;g];
    t1=(1/d)*ta;
    B=A(1,1:3);
    A(1:6,1)=[A(2:6,1);0]-t1*B(1,1);
    A(1:6,2)=[A(2:6,2);0]-t1*B(1,2);
    A(1:6,3)=[A(2:6,3);0]-t1*B(1,3);
elseif mod(n-6,3)==2
    ta=[c;b;a;e;f;g];
    t1=(1/d)*ta;
    tb=[b;a;e;f;g;0];
    tc=(1/d)*tb;
    td=(c/d)*t1;
    t2=td-tc;
    B=A(1:2,1:3);
    A(1:6,1)=[A(3:6,1);0;0]-t1*B(2,1)+t2*B(1,1);
    A(1:6,2)=[A(3:6,2);0;0]-t1*B(2,2)+t2*B(1,2);
    A(1:6,3)=[A(3:6,3);0;0]-t1*B(2,3)+t2*B(1,3);
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
