%233页第9题第3问。直接运行此脚本文件即可得到结果。
clc;
syms x y
y=cos(pi*x);
f1=matlabFunction(y);
d0=integral(f1,0,1);
f2=@(x)f1(x).*x;
d1=integral(f2,0,1);
f3=@(x)f1(x).*x.^2;
d2=integral(f3,0,1);
f4=@(x)f1(x).*x.^3;
d3=integral(f4,0,1);
H=[1,1/2,1/3,1/4;
  1/2,1/3,1/4,1/5;
  1/3,1/4,1/5,1/6;
  1/4,1/5,1/6,1/7;];
d=[d0;d1;d2;d3];
A=inv(H)*d;
syms x f;
f=A(4)*x^3+A(3)*x^2+A(2)*x+A(1);
digits(4);
fprintf('f(x)的最佳平方逼近多项式(3次)为：P3(x)=');
disp(vpa(f));