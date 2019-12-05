function f=Fdistribution(k,m,n,x)%F·Ö²¼
y1=fpdf(x,m,n);
figure(k);
plot(x,y1);
hold on;
y2=fcdf(x,m,n);
figure(k+1);
plot(x,y2);
hold on;