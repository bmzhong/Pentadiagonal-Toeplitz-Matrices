dyfun1=inline('2*x/y');
[x11,y11]=euler11(dyfun1,[0,1],1,0.1)
[x12,y12]=euler2(dyfun1,0,1,0.1,10)
[x13,y13]=eulert(dyfun1,0,1,0.1,10)
dyfun2=inline('x*y^2');
[x21,y21]=euler11(dyfun2,[0,1],1,0.1)
[x22,y22]=euler2(dyfun2,0,1,0.1,10)
[x23,y23]=eulert(dyfun2,0,1,0.1,10)