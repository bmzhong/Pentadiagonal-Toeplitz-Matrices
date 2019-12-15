function result=romberg(fname,a,b,ep)
i=1;
j=1;
step=b-a;
K(i,1)=step/2*(feval(fname,a)+feval(fname,b));
K(i+1,1)=K(i,1)/2+sum(feval(fname,a+step/2:b-step/2+0.001*step))*step/2;
K(i+1,j+1)=4^j*K(i+1,j)/(4^j-1)-K(i,j)/(4^j-1);
while abs(K(i+1,i+1))-K(i,i)>ep
    i=i+1;step=step/2;
    K(i+1,1)=K(i,1)/2+sum(feval(fname,a+step/2:step:b-step/2+0.001*step))*step/2;
             for j=1:i
                K(i+1,j+1)=4^j*K(i+1,j)/(4^j-1)-K(i,j)/(4^j-1);
             end
end
result=K(i+1,j+1);