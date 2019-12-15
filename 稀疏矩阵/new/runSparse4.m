clc
n=1000;
a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
det1=sparse4(n,a,b,c,d,e,f,g);
disp(det1);
det2=system_det(n,a,b,c,d,e,f,g);
disp(det2)