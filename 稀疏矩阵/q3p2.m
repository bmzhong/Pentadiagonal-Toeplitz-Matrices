%232页第3题第2小问。直接运行此脚本文件即可得到结果。
a=1;b=2;
f=@(x)1./x;
d0=integral(f,1,2);
a0=d0/1;
fprintf('f(x)的零次最佳平方逼近多项式为：P0(x)=%5.4d\n',a0);
f1=@(x)x.^0;
d1=integral(f1,1,2);
d=[d0;d1];
H=[1,1./2;1,1./3];
A=inv(H)*d;
syms x y;
y=A(1)+A(2)*x;
fprintf('f(x)的一次最佳平方逼近多项式为：P1(x)=');
digits(5);
disp(vpa(y));