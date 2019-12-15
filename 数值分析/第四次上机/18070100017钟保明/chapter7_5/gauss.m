function result=gauss(fname,a,b,n,t)
switch t
    case 1
    result=0;
    B=2;
    case 2
        result=[-1/sqrt(3),1/sqrt(3)];B=[1,1];
    case 3
        result=[-sqrt(0.6),0,sqrt(0.6)];B=[5/9,8/9,5/9];
    case 4
        result=[-0.861 136 -0.339 981 0.339 981 0.861 136];
        B=[0.347 855 0.652 145 0.652 145 0.347 855];
    case 5
        result=[-0.906 180 -0.538 469 0 0.538 469 0.906 180];
        B=[0.236 927 0.478 629 0.568 889 0.478 629 0.236 927];
    otherwise
        error('³ö´í');
end
x=linspace(a,b,n+1);temp=0;
for i=1:n
    temp=temp+gs(fname,x(i),x(i+1),B,result);
end
function temp=gs(fname,a,b,A,t)
temp=(b-a)/2*sum(A.*feval(fname,(b-a)/2*t+(a+b)/2));