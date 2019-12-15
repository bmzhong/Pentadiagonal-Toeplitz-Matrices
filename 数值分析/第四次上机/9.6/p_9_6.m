dyfun=inline('x+y');
[x1,y1]=euler11(dyfun,[0,1],1,0.1)
[x2,y2]=eulercorrect(dyfun,[0,1],1,0.1)