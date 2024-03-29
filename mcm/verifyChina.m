%获得中国每个阶段的P1 P2 lamda1 lamda2 i u0，以及获得验证的确诊人数
clc;clear;
T=14;%一个传播周期
[d,r,Itrue]=ChinaData();%获取中国的数据
%第一阶段
start1=1;
finish1=21;
n=start1-finish1;
d0_1=d(start1:finish1);
r0_1=r(start1:finish1);
Itrue1=Itrue(start1:finish1);
E0_1=526;
I0_1=r0_1(1);
lb=zeros(1,6);
ub=[1,1,1,1,1,1000000];
x0=[0.58,0.91,1,0.50,0.4,21220];
x=fmincon(@(x)getfunction(n,E0_1,I0_1,d0_1,r0_1,Itrue1,x),x0,[],[],[],[],lb,ub);

E1=[E0_1];
for j=1:n%获得Ek(1=<k<=n)
    y=(1-(1-x(4))/T+x(2)-x(4)*x(1))^j*E0_1+(x(5)*x(6))*( ( 1-(1-x(4))/T+x(2)-...
        x(4)*x(1))^j-(x(3)-x(4)+1)^j)/(-(1-x(4))/T+x(2)-x(4)*x(1)-x(3)+x(4));
    E1=[E1 y];
end
I1=[I0_1];
for j=1:n%获得I1k(1=<k<=n)
    y=I0_1+x(4)*x(1)*sum(E1(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
    I1=[I1 y];
end
% 第一阶段的验证值 I1

%第二阶段
start2=22;
finish2=50;
n=start2-finish2;
d0_2=d(start2:finish2);
r0_2=r(start2:finish2);
Itrue2=Itrue(start2:finish2);
E0_2=53284;
I0_2=r0_2(1);
lb=zeros(1,6);
ub=[1,1,1,1,1,1000000];
x0=[0.2,0.91,0.39,0.50,0.4,53200];
x=fmincon(@(x)getfunction(n,E0_2,I0_2,d0_2,r0_2,Itrue2,x),x0,[],[],[],[],lb,ub);
E2=[E0_2];
for j=1:n%获得Ek(1=<k<=n)
    y=(1-(1-x(4))/T+x(2)-x(4)*x(1))^j*E0_2+(x(5)*x(6))*( ( 1-(1-x(4))/T+x(2)...
        -x(4)*x(1))^j-(x(3)-x(4)+1)^j)/(-(1-x(4))/T+x(2)-x(4)*x(1)-x(3)+x(4));
    E2=[E2 y];
end
I2=[I0_2];
for j=1:n%获得I1k(1=<k<=n)
    y=I0_2+x(4)*x(1)*sum(E(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
    I2=[I2 y];
end
% 第二阶段的验证值 I2

%第三阶段
start3=51;
finish3=100;
n=start3-finish3;
d0_3=d(start3:finish3);
r0_3=r(start3:finish3);
Itrue3=Itrue(start3:finish3);
E0_3=53284;
I0_3=r0_3(1);
lb=zeros(1,6);
ub=[1,1,1,1,1,1000000];
x0=[0.45,0.91,0.479,0.90,0.8,5200];
x=fmincon(@(x)getfunction(n,E0_3,I0_3,d0_3,r0_3, Itrue3,x),x0,[],[],[],[],lb,ub);
E3=[E0_3];
for j=1:n%获得Ek(1=<k<=n)
    y=(1-(1-x(4))/T+x(2)-x(4)*x(1))^j*E0_3+(x(5)*x(6))*( ( 1-(1-x(4))/T+x(2)...
        -x(4)*x(1))^j-(x(3)-x(4)+1)^j)/(-(1-x(4))/T+x(2)-x(4)*x(1)-x(3)+x(4));
    E3=[E3 y];
end
I3=[I0_3];%感染者的初始人数
for j=1:n%获得I1k(1=<k<=n)
    y=I0_3+x(4)*x(1)*sum(E(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
    I3=[I3 y];
end
% 第三阶段的验证值 I3