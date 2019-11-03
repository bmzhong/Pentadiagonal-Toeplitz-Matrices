function det_T=k_7sparseMatrix(n,a,b,c,d,e,f,g)
T=zeros(n,n);
for i=1:n
    T(i,i)=a;
end
for i=1:n-1
    T(i+1,i)=e;
end
for i=1:n-2
    T(i+2,i)=f;
end
for i=1:n-3
    T(i+3,i)=g;
end
for i=2:n
    T(i-1,i)=b;
end
for i=3:n
    T(i-2,i)=c;
end
for i=4:n
    T(i-3,i)=d;
end
syms x dd;
y=-1*x/dd;
symvar(y);%�������ص��Ƿ��ź����е��Ա�����
fx=matlabFunction(y); %����f�ĵ�һ������Ϊd,�ڶ�������Ϊx��
A=[a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;
    ];
t=[c;b;a;e;f];
for i=1:n-6
    a11=A(1,1);a12=A(1,2);a13=A(1,3);
    A(1:5,1)=t*fx(d,A(1,1))+A(2:6,1);
    A(1:5,2)=t*fx(d,A(1,2))+A(2:6,2);
    A(1:5,3)=t*fx(d,A(1,3))+A(2:6,3);
    A(6,1)=g*fx(d,a11);
    A(6,2)=g*fx(d,a12);
    A(6,3)=g*fx(d,a13);
end
B=[d 0 0;
    c d 0;
    b c d;
    a b c;
    e a b;
    f e a;
    ];
P6=[B,A];
fprintf('(%d��)û�иĽ�֮ǰ�Ľ����',n);
if mod(n,2)==0
   det_T=-d^(n-6)*det(P6);
end
if mod(n,2)==1
    det_T=d^(n-6)*det(P6);
end
yy=6;
