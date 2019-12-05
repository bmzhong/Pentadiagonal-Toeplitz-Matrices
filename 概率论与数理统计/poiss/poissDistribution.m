function f=poissDistribution(k,x,m)
y1=poisspdf(x,m);
figure(k);
scatter(x,y1,'o');
hold on;
y2=poisscdf(x,m);
figure(k+1);
scatter(x,y2,'+');
hold on;