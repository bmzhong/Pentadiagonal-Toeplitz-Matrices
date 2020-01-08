function r=Gauss_row(n,a,b,c,d,e,f,g)
r=1;
A=[ a b c d 0 0 0;
    e a b c d 0 0 ;
    f e a b c d 0 ;
    g f e a b c d;];
for j=1:n-7
    r=r*A(1,1);
    A(2,2:7)=A(2,2:7)-(A(2,1)/A(1,1))*A(1,2:7);
    A(3,2:7)=A(3,2:7)-(A(3,1)/A(1,1))*A(1,2:7);
    A(4,2:7)=A(4,2:7)-(A(4,1)/A(1,1))*A(1,2:7);
    row=[g f e a b c d];
    zer=zeros(3,1);
    M=[A(2:4,2:7)  zer];
    A=[M;row];
end
r=r*A(1,1);
B=[A;
    0 g f e a b c;
    0 0 g f e a b;
    0 0 0 g f e a;];
for k=1:6
    B((k+1):7,(k+1):7)=B((k+1):7,(k+1):7)-B((k+1):7,k)/B(k,k)*B(k,(k+1):7);
    B((k+1):7,k)=zeros(7-k,1);
    r=r*B(k+1,k+1);
end






% function [r,time]=Gauss_row(n,a,b,c,d,e,f,g)
% d1=linspace(a,a,n);
% d2=linspace(b,b,n-1);
% d3=linspace(c,c,n-2);
% d4=linspace(d,d,n-3);
% d5=linspace(e,e,n-1);
% d6=linspace(f,f,n-2);
% d7=linspace(g,g,n-3);
% A=diag(d1,0)+diag(d2,1)+diag(d3,2)+diag(d4,3)+...
%     diag(d5,-1)+diag(d6,-2)+diag(d7,-3);
% tic;
% for co=1:5
%     u=1;
%     for k=1:(n-1)
%         [ap,p]=max(abs(A(k:n,k)));
%         p=p+k-1;
%         if p>k
%             t=A(k,:);
%             A(k,:)=A(p,:);
%             A(p,:)=t;
%             u=u+1;
%         end
%         A((k+1):n,(k+1):(n))=A((k+1):n,(k+1):(n))-A((k+1):n,k)/A(k,k)*A(k,(k+1):(n));
%         A((k+1):n,k)=zeros(n-k,1);
%     end
%     r=1;
%     for i=1:n
%         r=r*A(i,i);
%     end
%     r=-((-1)^u)*r;
% end
% time=toc;
