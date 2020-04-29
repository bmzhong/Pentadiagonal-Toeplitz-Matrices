% clear all;
% clc;
% N=[];
% R1=[];
% T1=[];
% R2=[];
% T2=[];
% for n=1000:1000:18000
%     [res1,res2,time1,time2]=GBkTCOPY(n);
%     R1=[R1 res1];
%     R2=[R2 res2];
%     T1=[T1 time1];
%     T2=[T2 time2];
%     N=[N n];
% end
[res1,res2,time1,time2]=GBkTCOPY(500);
R1=[res1 R1];
R2=[res2 R2];
T1=[time1 T1];
T2=[time2 T2];
N=[500 N];
[res1,res2,time1,time2]=GBkTCOPY(100);
R1=[res1 R1];
R2=[res2 R2];
T1=[time1 T1];
T2=[time2 T2];
N=[100 N];
[res1,res2,time1,time2]=GBkTCOPY(50);
R1=[res1 R1];
R2=[res2 R2];
T1=[time1 T1];
T2=[time2 T2];
N=[50 N];

[res1,res2,time1,time2]=GBkTCOPY(10);
R1=[res1 R1];
R2=[res2 R2];
T1=[time1 T1];
T2=[time2 T2];

N=[10 N];
disp(N);
figure(1)
plot(N,T1);
hold on;
plot(N,T2);
hold on