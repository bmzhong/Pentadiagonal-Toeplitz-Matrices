%232ҳ��8�⡣ֱ�����д˽ű��ļ����ɵõ������
a=1;b=2;
f=@(x)sqrt(x);
d0=integral(f,1,2);
f1=@(x)sqrt(x).*x;
d1=integral(f1,1,2);
d=[d0;d1];
H=[1,1./2;1,1./3];
A=inv(H)*d;
syms x y;
y=A(1)+A(2)*x;
fprintf('f(x)��һ�����ƽ���ƽ�����ʽΪ��P1(x)=');
digits(5);
disp(vpa(y));