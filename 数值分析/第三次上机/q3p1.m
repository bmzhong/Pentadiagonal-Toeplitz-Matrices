func=inline('1/x','x');
max=func(1);
min=func(2);
p0x=(max+min)/2;
%零次最佳一致逼近多项式：
fprintf('f(x)在[1,2]上的零次最佳一致逼近多项式为：%d\n',p0x);
a1=(func(2)-func(1))/(b-a);
