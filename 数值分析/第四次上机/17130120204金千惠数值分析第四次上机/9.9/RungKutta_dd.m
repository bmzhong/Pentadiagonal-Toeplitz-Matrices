function [x,y,dy]=RungKutta_dd(ddyfun,x0,y0,dy0,h,N);
    x=x0:h:x0+N*h;
    y=zeros(1,N+1);
    dy=zeros(1,N+1);
    y(1)=y0; 
    dy(1)=dy0;
    for i=1:N
        k1=h*feval(ddyfun,x(i),y(i),dy(i));
        k2=h*feval(ddyfun,x(i)+h/2,y(i)+h*dy(i),dy(i)+1/2*k1);
        k3=h*feval(ddyfun,x(i)+h/2,y(i)+h*dy(i)+1/4*k1,dy(i)+1/2*k1);
        k4=h*feval(ddyfun,x(i+1),y(i)+h*dy(i)+1/2*k2,dy(i)+k3);
        y(i+1)=y(i)+h*dy(i)+h/6*(k1+k2+k3);
        dy(i+1)=dy(i)+h/6*(k1+2*k2+2*k3+k4);
    end