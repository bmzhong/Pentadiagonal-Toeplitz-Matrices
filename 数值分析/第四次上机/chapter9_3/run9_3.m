f1=inline('y.^2*exp(-x)');
[x1,y1]=rung_kutta(f1,1,1,0.1,10);
f2=inline('x.^2+x.^3*y');
[x2,y2]=rung_kutta(f2,1,1,0.1,10);
fprintf("第9章第3题第1问：\n")
fprintf("x1: %5.4d\n",x1);
fprintf("y1:%5.4d\n",y1);
fprintf("第9章第3题第3问：\n")
fprintf("x2: %5.4d\n",x2);
fprintf("y2:%5.4d\n",y2);