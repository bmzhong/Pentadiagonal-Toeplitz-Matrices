function f=binoDistribution(k,N,p,x)
y1=binopdf(N,p);
figure(k);
plot(x,y1);
hold on;
y2=binocdf(N,p);
figure(k+1);
plot(x,y2);
hold on;