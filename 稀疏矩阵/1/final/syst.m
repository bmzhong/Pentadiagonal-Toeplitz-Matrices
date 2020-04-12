function det_T=syst(n,a,b,c,d,e,f,g)
if nargin<8||n<4||d==0
    error('输入参数不合法');
end
d1=linspace(a,a,n);
d2=linspace(b,b,n-1);
d3=linspace(c,c,n-2);
d4=linspace(d,d,n-3);
d5=linspace(e,e,n-1);
d6=linspace(f,f,n-2);
d7=linspace(g,g,n-3);
T=diag(d1,0)+diag(d2,1)+diag(d3,2)+diag(d4,3)+...
    diag(d5,-1)+diag(d6,-2)+diag(d7,-3);
det_T=det(T);