x=0:1/16:1;
z=0:1/4:1;
y=1./x;
w=1./z;
T1=tquad(x,y)
T2=squad(z,w)
R=romberg(inline('1./x'),eps,1,1e-5)
t=gaussint(inline('1./x'),eps,1,4,2);