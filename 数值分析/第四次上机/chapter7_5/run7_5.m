x1=0:1/16:1;
x2=0:1/4:1;
y1=1./x1;
y2=1./x2;
r1=trap(x1,y1);
r2=simpson(x2,y2);
f=inline('1./x');
r3=romberg(f,eps,1,1e-5);
r4=gauss(f,eps,1,4,2);
fprintf("复合梯形公式计算结果：%d\n",r1);
fprintf("复合Simpson计算结果：%d\n",r2);
fprintf("Romberg算法计算结果：%d\n",r3);
fprintf("gauss公式计算结果：%d\n",r4(2))