function t=gaussint(fname,a,b,n,m)
switch m case 1
    t=0,A=2;
    case 2
        t=[-1/sqrt(3),1/sqrt(3)];A=[1,1];
    case 3
        t=[-sqrt(0.6),0,sqrt(0.6)];A=[5/9,8/9,5/9];
    case 4
        t=[-0.861 136 -0.339 981 0.339 981 0.861 136];
        A=[0.347 855 0.652 145 0.652 145 0.347 855];
    case 5
        t=[-0.906 180 -0.538 469 0 0.538 469 0.906 180];
        A=[0.236 927 0.478 629 0.568 889 0.478 629 0.236 927];
    otherwise
        error('本程序Gauss点只能取1,2,3,4,5');
end
x=linspace(a,b,n+1);g=0;
for i=1:n
    g=g+gsint(fname,x(i),x(i+1),A,t);
end
function g=gsint(fname,a,b,A,t)
g=(b-a)/2*sum(A.*feval(fname,(b-a)/2*t+(a+b)/2));