syms x y;
y=1/x;
f=matlabFunction(y);
%232ҳ��3���1С�ʡ�
y1=diff(y);
f1=matlabFunction(y1);
a=2;  b=1;
max=f(b);
min=f(a);
p0x=(max+min)/2;
digits(4);
format short 
fprintf('f(x)��[1,2]�ϵ�������һ�±ƽ�����ʽΪ��%4.3d\n',p0x);
a1=(f(b)-f(a))/(b-a);
A=solve(y1==a1);
x2=A(1);
a0=(f(a)+f(x2))/2-a1*(a+x2)/2;
y=a1*x+a0;
fprintf('f(x)��[1,2]�ϵ�һ�����һ�±ƽ�����ʽΪ:  ');
disp(vpa(y));