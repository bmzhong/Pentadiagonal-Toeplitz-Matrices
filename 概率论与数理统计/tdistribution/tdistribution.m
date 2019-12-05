function t=tdistribution(n,a,b,x) %t分布
y=tpdf(x-a,b); %1是中心，2 是自由度
figure(n);
plot(x,y)
hold on;
y=tcdf(x-a,b);
figure(n+1);
plot(x,y)
hold on