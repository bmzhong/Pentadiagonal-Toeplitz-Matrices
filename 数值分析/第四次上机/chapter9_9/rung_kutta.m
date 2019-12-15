function [x,y,z]=rung_kutta(f,x0,y0,k,h,n1)
    x=x0:h:x0+n1*h;
    y=zeros(1,n1+1);
    z=zeros(1,n1+1);
    y(1)=y0; 
    z(1)=k;
    for i=1:n1
        k1=h*feval(f,x(i),y(i),z(i));
        k2=h*feval(f,x(i)+h/2,y(i)+h*z(i),z(i)+1/2*k1);
        k3=h*feval(f,x(i)+h/2,y(i)+h*z(i)+1/4*k1,z(i)+1/2*k1);
        k4=h*feval(f,x(i+1),y(i)+h*z(i)+1/2*k2,z(i)+k3);
        y(i+1)=y(i)+h*z(i)+h/6*(k1+k2+k3);
        z(i+1)=z(i)+h/6*(k1+2*k2+2*k3+k4);
    end