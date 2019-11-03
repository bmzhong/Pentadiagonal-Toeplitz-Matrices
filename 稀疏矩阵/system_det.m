function det_T=system_det(n,a,b,c,d,e,f,g)
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
fprintf("(%d阶)系统det()函数的结果: ",n);
det_T=det(T);