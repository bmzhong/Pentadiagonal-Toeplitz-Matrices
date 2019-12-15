dyfun1=inline('sin(x)+exp(-x)');
[x1,y1]=euler1(dyfun1,[0,1],-2,0.1)
dyfun2=inline('x^2+100*y^2');
[x2,y2]=euler11(dyfun2,[0,1],0,0.1)