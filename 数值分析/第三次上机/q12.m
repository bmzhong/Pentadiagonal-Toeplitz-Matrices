%232页第12题。直接运行此脚本文件即可得到结果。
clc;
syms x y;
y=log(x);
f=matlabFunction(y);
y1=diff(y);
f1=matlabFunction(y1);
a=1;  b=2;
a1=(f(b)-f(a))/(b-a);
A=solve(y1==a1);
x2=A(1);
a0=(f(a)+f(x2))/2-a1*(a+x2)/2;
y=a1*x+a0;
fprintf('f(x)在[1,2]上的一次最佳一致逼近多项式为:  P(x)=');
disp(vpa(y));