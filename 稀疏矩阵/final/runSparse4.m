clc
n=1000;
a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;

tic
for i=1:50
det1=sparse4(n,a,b,c,d,e,f,g);
end
time1=toc;
fprintf("值：%15.12d, 时间：%15.12d\n",det1,time1/50);

[det2,time2]=system_det(n,a,b,c,d,e,f,g);
fprintf("值：%15.12d, 时间：%15.12d\n",det2,time2/50)