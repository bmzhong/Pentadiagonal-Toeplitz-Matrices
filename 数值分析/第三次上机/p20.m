x1=[19,25,31,38,44];
y1=[19.0,32.3,49.0,73.3,97.8];
f = inline('beta(1)+beta(2).*x.^2','beta','x');
beta0=[0.5,0.5]';
beta=nlinfit(x1,y1,f,beta0);
syms x y;
y=beta(1)+beta(2)*x^2;
digits(4);
disp(vpa(y));
scatter