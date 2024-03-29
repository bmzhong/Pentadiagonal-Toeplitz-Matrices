%233页第19题，使用nlinfit函数拟合，结果包含指数函数公式和图像。
clc;
x1=[1,2,3,4,5,6,7,8];
y1=[15.3,20.5,27.4,34.6,49.1,65.6,87.8,117.6];
f = inline('beta(1).*exp(beta(2).*x)','beta','x');
beta0=[0.2,0.2]';
beta=nlinfit(x1,y1,f,beta0);
syms x y;
y=beta(1)*exp(beta(2)*x);
digits(4);
fprintf('拟合公式为：f(x)=');
disp(vpa(y));
figure(1);
scatter(x1,y1);
hold on;
g=ezplot(y);
set(g,'Color','r','LineWidth',1);
