function normDistribution(n,x,sigma,u)
y=normpdf(x,sigma,u);
figure (n);
plot(x,y);
hold on
y = normcdf(x, sigma,u);
figure (n+1);
plot(x,y);
hold on;