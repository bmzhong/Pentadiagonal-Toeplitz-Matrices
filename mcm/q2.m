clc
E0=111;
n=5;
T=14;
I0=111;
E=[E0];
for j=1:n
    y=(1-(1-x(4))/T+x(2)-x(4)*x(1))^j*E0+(x(5)*x(6))*( ( 1-(1-x(4))/T+x(2)-x(4)*x(1))^j-(x(3)-x(4)+1)^j)/(-(1-x(4))/T+x(2)-x(4)*x(1)-x(3)+x(4));
    E=[E y];
end
r=ones(1,n+1);
d=ones(1,n+1);
I=[I0];
for j=1:n
    y=I0+x(4)*x(1)*sum(E(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
    I=[I y];
end
It=ones(1,n+1);
f=sum((I(1:n+1)-It(1:n+1)).^2);
% g = matlabFunction(f);
% disp(g)
% x0=[0,0,0,0,0,0.1];
% x=fminunc(g,x0)




% clc
% E0=111;
% n=5;
% T=14;
% I0=111;
% syms p1 p2 lamda1 lamda2 i U0 y f;
% E=[E0];
% for j=1:n
%     y=(1-(1-p1)/T+lamda1-p1*i)^j*E0+(p2*u0)*( ( 1-(1-p1)/T+lamda1-p1*i)^j-(lamda2-p1+1)^j)/(-(1-p1)/T+lamda1-p1*i-lamda2+p1);
%     E=[E y];
% end
% r=ones(1,n+1);
% d=ones(1,n+1);
% I=[I0];
% for j=1:n
%     y=I0+p1*i*sum(E(1:j))-sum( (r(1:j)+d(1:j)).*I(1:j) );
%     I=[I y];
% end
% It=ones(1,n+1);
% f=sum((I(1:n+1)-It(1:n+1)).^2);
% g = matlabFunction(f);
% disp(g)
% x0=[0,0,0,0,0,0.1];
% x=fminunc(g,x0)

