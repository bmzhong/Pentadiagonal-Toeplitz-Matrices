%234页第20题，使用nlinfit函数拟合，结果包含二次函数公式和图像。
x1=[19,25,31,38,44];
y1=[19.0,32.3,49.0,73.3,97.8];
f = inline('beta(1)+beta(2).*x.^2','beta','x');
beta0=[0.5,0.5]'; 
beta=nlinfit(x1,y1,f,beta0);
syms x y;
y=beta(1)+beta(2)*x^2;
digits(4);
fprintf('拟合后的结果为：f(x)=');
disp(vpa(y));
figure(2);
scatter(x1,y1);
hold on;
g=fplot(y,[-90 90]);
set(g,'Color','r','LineWidth',1);

