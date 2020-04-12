%符号计算各项系数(cij)
function AS=sparse2(k)
syms a b c d e f g no;
syms a11 a12 a13 a21 a22 a23 a31 a32 a33;
syms a41 a42 a43 a51 a52 a53 a61 a62 a63;
AS=[a11 a12 a13;
        a21 a22 a23;
        a31 a32 a33;
        a41 a42 a43;
        a51 a52 a53;
        a61 a62 a63];
ta=[c;b;a;e;f;g];     
 CS=AS(1:6,1);
for i=1:k
    BS=AS(1,1:3);
    AS(1:6,1)=[AS(2:6,1);0]-ta*BS(1,1);
    AS(1:6,2)=[AS(2:6,2);0]-ta*BS(1,2);
    AS(1:6,3)=[AS(2:6,3);0]-ta*BS(1,3);
end
c=[a11,a11,a11,a11,a11,a11;
    a11,a11,a11,a11,a11,a11;
    a11,a11,a11,a11,a11,a11;
    a11,a11,a11,a11,a11,a11;
    a11,a11,a11,a11,a11,a11;
    a11,a11,a11,a11,a11,a11;];
for i=1:1:6
    for j=1:1:6
        f=coeffs(AS(i,1),CS(j));
        if length(f)==2
            c(i,j)=f(2);
        end
        if length(f)==1
            v=symvar(AS(i,1));
            if ismember(CS(j),v)
               c(i,j)=f(1);
            else
                c(i,j)=no;
            end
        end
    end
end
disp(c);

