clc
clear
x=1:0.01:2;
y=x./log(1+x);
result=trapz(x,y);
fprintf("�����µ�2���2�ʵĻ��ֽ���� %6.5d\n",result);

