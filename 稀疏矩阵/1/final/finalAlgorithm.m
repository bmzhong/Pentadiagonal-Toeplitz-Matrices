function [det_T]=finalAlgorithm(n,a,b,c,d,e,f,g,k)
d1=d;%用于后面计算行列式前的d^(n-6)
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
A=[a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;];
B=[d 0 0;
    c d 0;
    b c d;
    a b c;
    e a b;
    f e a;
    ];
C=[-c 1 0 0 0 0;
        -b 0 1 0 0 0;
        -a 0 0 1 0 0;
        -e 0 0 0 1 0;
        -f 0 0 0 0 1;
        -g 0 0 0 0 0;];
r=mod(n-6,k);
 q=(n-6-r)/k;
 D=C^k;
 for i=1:q
     A=D*A;
 end
 for i=1:r
     A=C*A;
 end
 P=[B,A];
 det_T=(-1)^(n-1)*d1^(n-6)*det(P);
 



