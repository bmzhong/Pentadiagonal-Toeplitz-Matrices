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
cftool(date,D);
cftool(date,R);

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