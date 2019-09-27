function [p,y,err]=muller(f,p0,p1,p2,delta,epsilon,max1)
P=[p0,p1,p2];
Y=feval(f,P);
for k=1:max1
    h0=P(1)-P(3);
    h1=P(2)-P(3);
    e0=Y(1)-Y(3);
    e1=Y(2)-Y(3);
    c=Y(3);
    denom=h1*h0^2-h0*h1^2;
    a=(e0*h1-e1*h0)/denom;
    b=(e1*h0^2-e0*h1^2)/denom;
    if b^2-4*a*c>0
        disc=sqrt(b^2-4*a*c);
    else
        disc=0;
    end
    if b<0
        disc=-disc;
    end
    z=-2*c/(b+disc);
    p=P(3)+z;
    if abs(p-P(2))<abs(p-P(1))
        Q=[P(2) P(1) P(3)];
        P=Q;
        Y=feval(f,P);
    end
    if abs(p-P(3))<abs(p-P(2))
        R=[P(1) P(3) P(1)];
        P=R;
        Y=feval(f,P);
    end
    P(3)=P;
    Y(3)=feval(f,P(3));
    y=Y(3);
    err=abs(z);
    relerr=err/(abs(p)+delta);
    if (err<delta)|(relerr<delta)|(abs(y)<epsilon)
        break;
    end
end
