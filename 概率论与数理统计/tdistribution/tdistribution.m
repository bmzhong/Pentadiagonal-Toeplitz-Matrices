function t=tdistribution(n,a,b,x) %t�ֲ�
y=tpdf(x-a,b); %1�����ģ�2 �����ɶ�
figure(n);
plot(x,y)
hold on;
y=tcdf(x-a,b);
figure(n+1);
plot(x,y)
hold on