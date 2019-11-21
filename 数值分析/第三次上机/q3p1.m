syms x y;
y=1/x;
f=matlabFunction(y);
y1=diff(y);
f1=matlabFunciton(y1);
max=f(1);
min=f(2);
p0x=(max+min)/2;
%零次最佳一致逼近多项式：
fprintf('f(x)在[1,2]上的零次最佳一致逼近多项式为：%d\n',p0x);
a1=(f(2)-f(1))/(b-a);
solve()