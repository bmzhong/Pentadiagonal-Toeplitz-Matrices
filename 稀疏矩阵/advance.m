function [det_T,time]=advance(n,a,b,c,d,e,f,g)
% d1=linspace(a,a,n);
% d2=linspace(b,b,n-1);
% d3=linspace(c,c,n-2);
% d4=linspace(d,d,n-3);
% d5=linspace(e,e,n-1);
% d6=linspace(f,f,n-2);
% d7=linspace(g,g,n-3);
% T=diag(d1,0)+diag(d2,1)+diag(d3,2)+diag(d4,3)+...
%   diag(d5,-1)+diag(d6,-2)+diag(d7,-3);
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
