%获得函数句柄
function f=getfunction(n,E0,I0,d,r,Itrue,x)
T=14;%一个传播周期
E=[E0];%潜伏者的初始人数
for j=1:n%获得Ek(1=<k<=n)
    y=(1-(1-x(4))/T+x(2)-x(4)*x(1))^j*E0+(x(5)*x(6))*( ( 1-(1-x(4))/T+x(2)-x(4)*x(1))^j-(x(3)-x(4)+1)^j)/(-(1-x(4))/T+x(2)-x(4)*x(1)-x(3)+x(4));
    E=[E y];
end
I=[I0];%感染者的初始人数
for j=1:n%获得Ik(1=<k<=n)
    y=I0+x(4)*x(1)*sum(E(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
    I=[I y];
end
f=sum((I(1:n+1)-Itrue(1:n+1)).^2);%返回函数句柄



