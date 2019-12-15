ddfun=inline('2*y^3','x','y','z');
[x,y,z]=RungKutta_dd(ddfun,1,-1,-1,0.1,5)