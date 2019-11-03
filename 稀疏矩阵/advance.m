function det_T=advance(n,a,b,c,d,e,f,g)
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
copyd=d;
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
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
    A(1:5,1)=t*(-a11)+A(2:6,1);
    A(1:5,2)=t*(-a12)+A(2:6,2);
    A(1:5,3)=t*(-a13)+A(2:6,3);
    A(6,1)=-g*a11;
    A(6,2)=-g*a12;
    A(6,3)=-g*a13;
end
B=[d 0 0;
   c d 0;
   b c d;
   a b c;
   e a b;
   f e a;
   ];
P6=[B,A];
fprintf("(%d��)�Ľ�֮��Ľ����",n);
if mod(n,2)==0
   det_T=-copyd^n*det(P6);
end
if mod(n,2)==1
   det_T=copyd^n*det(P6);
end
