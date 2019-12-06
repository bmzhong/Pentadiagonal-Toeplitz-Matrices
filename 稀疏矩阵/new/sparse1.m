function [det_T,time]=sparse1(n,k,a,b,c,d,e,f,g)
if nargin<8||n<4||d==0
    error('输入参数不合法');
end
d1=d;%用于后面计算行列式前的d^(n-6)
a=a/d;b=b/d;c=c/d;e=e/d;f=f/d;g=g/d;d=1;
A=[a b c;
    e a b;
    f e a;
    g f e;
    0 g f;
    0 0 g;];
B3=[d 0 0;
    c d 0;
    b c d;
    a b c;
    e a b;
    f e a;];
syms a11 a12 a13 a21 a22 a23 a31 a32 a33;
syms a41 a42 a43 a51 a52 a53 a61 a62 a63;
AS=[a11 a12 a13;
    a21 a22 a23;
    a31 a32 a33;
    a41 a42 a43;
    a51 a52 a53;
    a61 a62 a63];
CS=AS(1:6,1);
t=[c;b;a;e;f;g];
tic
    for i=1:k
        BS=AS(1,1:3);
        AS(1:6,1)=[AS(2:6,1);0]-t*BS(1,1);
        AS(1:6,2)=[AS(2:6,2);0]-t*BS(1,2);
        AS(1:6,3)=[AS(2:6,3);0]-t*BS(1,3);
    end
    coe=zeros(6,6);
    for i=1:6
        for j=1:6
            f=coeffs(AS(i,1),CS(j));
            if length(f)==2
                coe(i,j)=f(2);
            end
            if length(f)==1
                v=symvar(AS(i,1));
                if ismember(CS(j),v)
                    coe(i,j)=f(1);
                else
                    coe(i,j)=0;
                end
            end
        end
    end
    q=floor((n-6)/k);
    r=mod(n-6,k);
    for i=1:q
        B1=A;
        A=coe*B1;
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
    P6=[B3,A];
    if mod(n,2)==0
        det_T=-y*det(P6);
    end
    if mod(n,2)==1
        det_T=y*det(P6);
    end
time=toc;