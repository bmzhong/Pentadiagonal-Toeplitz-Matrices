clc;clear all;
filename="China.xlsx";
patients=readmatrix(filename,'sheet',1,'range','I3:I102');
dead=readmatrix(filename,'sheet',1,'range','F3:F102');
recovery=readmatrix(filename,'sheet',1,'range','G3:G102');
d0=0;
r0=0;
D=zeros(1,100);
R=zeros(1,100);
for i=1:100
    D(i)=(dead(i)-d0)/patients(i);
    d0=dead(i);
    R(i)=(recovery(i)-r0)/patients(i);
    r0=recovery(i);
end
date=zeros(1,100);
for i=1:100
    date(i)=i;
end
cftool(date,D);
cftool(date,R);

% filename="India.xlsx";
% patients=readmatrix(filename,'sheet',1,'range','B2:B72');
% dead=readmatrix(filename,'sheet',1,'range','D2:D72');
% recovery=readmatrix(filename,'sheet',1,'range','C2:C72');
% D=zeros(1,71);
% R=zeros(1,71);
% for i=13:71
%     D(i)=dead(i)/patients(i);
%     R(i)=(recovery(i))/patients(i);
% end
% date=zeros(1,71);
% for i=1:71
%     date(i)=i;
% end
% cftool(date,D);

% figure(3)
% scatter(date,D);
% hold on;
% figure(4)
% scatter(date,R);
% hold on;

filename="Korea.xlsx";
patients=readmatrix(filename,'sheet',1,'range','E2:E77');
dead=readmatrix(filename,'sheet',1,'range','D2:D77');
recovery=readmatrix(filename,'sheet',1,'range','C2:C77');
D=zeros(1,76);
R=zeros(1,76);
for i=1:76
    D(i)=dead(i)/patients(i);
    R(i)=(recovery(i))/patients(i);
end
date=zeros(1,76);
for i=1:76
    date(i)=i;
end
cftool(date,R);

% figure(5)
% scatter(date,D);
% hold on;
% figure(6)
% scatter(date,R);
% hold on;