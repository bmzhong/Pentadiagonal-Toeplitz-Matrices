function [det_T]=sparse4(n,a,b,c,d,e,f,g)
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
D=[-c 1 0 0 0 0;
        -b 0 1 0 0 0;
        -a 0 0 1 0 0;
        -e 0 0 0 1 0;
        -f 0 0 0 0 1;
        -g 0 0 0 0 0;];
u=n-6;
x=1;
Y=eye(6);
while u~=0
    r=mod(u,2);
    u=floor(u/2);
    if r==1  
        x=x*d1;
        Y=Y*D;
    end
    d1=d1*d1;
    D=D*D; 
end
C=Y*A;
E=[B,C];
if mod(n,2)==0
    det_T=-x*det(E);
end
if mod(n,2)==1
    det_T=x*det(E);
end



