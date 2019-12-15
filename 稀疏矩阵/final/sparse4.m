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
coe=[-c 1 0 0 0 0;
        -b 0 1 0 0 0;
        -a 0 0 1 0 0;
        -e 0 0 0 1 0;
        -f 0 0 0 0 1;
        -g 0 0 0 0 0;];
u=n-6;
w=coe;
y=eye(6);
while u~=0
    r=mod(u,2);
    u=floor(u/2);
    if r==1  
        y=y*w;
    end
    w=w*w;
end
C=y*A;
E=[B,C];
u1=n-6;
w1=d1;
y1=1;
while u1~=0
    r1=mod(u1,2);
    u1=floor(u1/2);
    if r1==1
        y1=y1*w1;
    end
    w1=w1*w1;
end
if mod(n,2)==0
    det_T=-y1*det(E);
end
if mod(n,2)==1
    det_T=y1*det(E);
end



