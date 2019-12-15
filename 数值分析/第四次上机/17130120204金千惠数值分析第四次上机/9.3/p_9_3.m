dyfun1=inline('y^2*exp(-x)');
[x1,y1]=RungKutta41(dyfun1,1,1,0.1,10)
dyfun2=inline('x^2+x^3*y');
[x2,y2]=RungKutta41(dyfun2,1,1,0.1,10)