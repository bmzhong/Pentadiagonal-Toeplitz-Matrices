function AS=sparse1(n,k,a,b,c,d,e,f,g)
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
syms a11 a12 a13 a21 a22 a23 a31 a32 a33;
syms a41 a42 a43 a51 a52 a53 a61 a62 a63;
AS=[a11 a12 a13;
        a21 a22 a23;
        a31 a32 a33;
        a41 a42 a43;
        a51 a52 a53;
        a61 a62 a63];
ta=[c;b;a;e;f;g];
% t1=(1/d)* ta;                    
for i=1:k
    BS=AS(1,1:3);
    AS(1:6,1)=[AS(2:6,1);0]-ta*BS(1,1);
    AS(1:6,2)=[AS(2:6,2);0]-ta*BS(1,2);
    AS(1:6,3)=[AS(2:6,3);0]-ta*BS(1,3);
end
% B=[d 0 0;
%    c d 0;
%    b c d;
%    a b c;
%    e a b;
%    f e a;
%    ];
% for i=1:1:5
%     for j=1:1:6
%         AS(i,j)=collect(AS(i,j),a11);
%     end
% end
disp(AS);
%  c = sym2poly(AS(1,1));
%  disp(c);
%  fnew=collect(AS(1,1),a11);
%  disp(fnew);
f=coeffs(A(1,1),a11);
disp(f);
