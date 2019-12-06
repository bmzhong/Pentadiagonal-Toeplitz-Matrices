clc;
clear;
n=20000;
a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
% k1=floor(sqrt(3*(n-6)))-100;
k1=1;
k2=floor(sqrt(3*(n-6)))+20;
k3=floor(sqrt(3*(n-6)));
% k1=120;
% k2=200;
%  k3=floor(sqrt(3*(n-6)));
% [det_T,time]=system_det(n,a,b,c,d,e,f,g);
% fprintf('(%d論)matlabㄩ%19.18d  time: %19.18d\n',n,det_T,time/50);

t1=0;
for i=1:1000
[det_T1,time1]=sparse3(n,k1,a,b,c,d,e,f,g);
t1=time1+t1;
end
fprintf('(%d論)k1ㄩ%19.18d  time: %19.18d\n',n,det_T1,t1/1000);

t2=0;
for i=1:1000
[det_T2,time2]=sparse3(n,k2,a,b,c,d,e,f,g);
t2=time2+t2;
end
fprintf('(%d論)k2ㄩ%19.18d  time: %19.18d\n',n,det_T2,t2/1000);

t3=0;
for i=1:1000
[det_T3,time3]=sparse3(n,k3,a,b,c,d,e,f,g);
t3=time3+t3;
end
fprintf('(%d論)k3ㄩ%19.18d  time: %19.18d\n',n,det_T3,t3/1000);