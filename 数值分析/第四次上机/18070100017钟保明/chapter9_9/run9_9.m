f=inline('2*y^3','x','y','z');
[x,y,z]=rung_kutta(f,1,-1,-1,0.1,5);
fprintf("��9�µ�9��Ľ��:\n");
fprintf("x: %6.5d\n",x);
fprintf("y:%6.5d\n",y);
fprintf("z:%6.5d\n",z);