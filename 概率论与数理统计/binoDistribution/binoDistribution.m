function f=binoDistribution(k,N,p,x)
y1=binopdf(x,N,p);
figure(k);
scatter(x,y1,'o');
hold on;
y2=binocdf(x,N,p);
figure(k+1);
scatter(x,y2,'+');
hold on;