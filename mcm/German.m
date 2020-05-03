% clc;clear all;
% filename="German.xlsx";
% % patients=readmatrix(filename,'sheet',1,'range','I3:I102');
% d=readmatrix(filename,'sheet',1,'range','D2:F70');
% r=readmatrix(filename,'sheet',1,'range','E2:E70');
% d0=0;
% r0=0;
% D=zeros(1,69);
% R=zeros(1,69);
% for i=1:69
%     D(i)=d(i)-d0;
%     d0=d(i);
%     R(i)=r(i)-r0;
%     r0=r(i);
% end
% writematrix(D',filename,'sheet',1,'range','G2:G70');
% writematrix(R',filename,'sheet',1,'range','H2:H70');


% clc;clear all;
% filename="German.xlsx";
% new_inc=readmatrix(filename,'sheet',1,'range','B2:B70');
% dead=readmatrix(filename,'sheet',1,'range','C2:C70');
% recovery=readmatrix(filename,'sheet',1,'range','D2:D70');
% now_patients=readmatrix(filename,'sheet',1,'range','G2:G70');
% date=zeros(1,69);
% for i=1:69
%     date(i)=i;
% end
% figure(1)
% plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
% hold on;

clc;clear all;
filename="German.xlsx";
patients=readmatrix(filename,'sheet',1,'range','G2:G70');
dead=readmatrix(filename,'sheet',1,'range','E2:E70');
recovery=readmatrix(filename,'sheet',1,'range','F2:F70');
d0=0;
r0=0;
D=zeros(1,69);
R=zeros(1,69);
for i=1:69
    D(i)=dead(i)/patients(i);
    R(i)=recovery(i)/patients(i);
end
date=zeros(1,69);
for i=1:69
    date(i)=i;
end
cftool(date,D);
cftool(date,R);