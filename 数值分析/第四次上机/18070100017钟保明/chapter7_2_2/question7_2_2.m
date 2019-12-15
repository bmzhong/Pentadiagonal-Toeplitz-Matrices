clc
clear
x=1:0.01:2;
y=x./log(1+x);
result=trapz(x,y);
fprintf("第七章第2题第2问的积分结果： %6.5d\n",result);

