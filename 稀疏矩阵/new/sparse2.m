function AS=sparse2(k)
syms a b c d e f g;
syms a11 a12 a13 a21 a22 a23 a31 a32 a33;
syms a41 a42 a43 a51 a52 a53 a61 a62 a63;
AS=[a11 a12 a13;
        a21 a22 a23;
        a31 a32 a33;
        a41 a42 a43;
        a51 a52 a53;
        a61 a62 a63];
ta=[c;b;a;e;f;g];                    
for i=1:k
    BS=AS(1,1:3);
    AS(1:6,1)=[AS(2:6,1);0]-ta*BS(1,1);
    AS(1:6,2)=[AS(2:6,2);0]-ta*BS(1,2);
    AS(1:6,3)=[AS(2:6,3);0]-ta*BS(1,3);
end
