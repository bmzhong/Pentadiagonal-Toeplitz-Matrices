function r=Gauss_row(n,a,b,c,d,e,f,g)
d1=linspace(a,a,n);
d2=linspace(b,b,n-1);
d3=linspace(c,c,n-2);
d4=linspace(d,d,n-3);
d5=linspace(e,e,n-1);
d6=linspace(f,f,n-2);
d7=linspace(g,g,n-3);
A=diag(d1,0)+diag(d2,1)+diag(d3,2)+diag(d4,3)+...
  diag(d5,-1)+diag(d6,-2)+diag(d7,-3);
for k=1:(n-1)
    [ap,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    if p>k
        t=A(k,:);
        A(k,:)=A(p,:);
        A(p,:)=t;
    end
    A((k+1):n,(k+1):(n))=A((k+1):n,(k+1):(n))-A((k+1):n,k)/A(k,k)*A(k,(k+1):(n));
    A((k+1):n,k)=zeros(n-k,1);
end
r=1;
for i=1:n
    r=r*A(i,i);
end
