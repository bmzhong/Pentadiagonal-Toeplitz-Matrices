f1=inline('sqrt(1-0.5*sin(x).^2)');
f3=inline('exp(1).^(-x.^2)*sqrt(1+x.^2)');
r1=gauss(f1,0,pi/2);
r3=gauss(f3,-10^100,10^100);
fprintf("�����µ�6���1�ʣ�%d\n",r1);
fprintf("�����µ�6���3�ʣ�%d\n",r3);