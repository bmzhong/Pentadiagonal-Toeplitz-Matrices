% clc;clear all;
% filename="China.xlsx";
% new_inc=readmatrix(filename,'sheet',1,'range','D3:D102');
% dead=readmatrix(filename,'sheet',1,'range','F3:F102');
% recovery=readmatrix(filename,'sheet',1,'range','G3:G102');
% now_patients=readmatrix(filename,'sheet',1,'range','I3:I102');
% date=zeros(1,100);
% for i=1:100
%     date(i)=i;
% end
% figure(1)
% plot(date,new_inc,'-+y',date,dead,'-*b',date,recovery,'-.r',date,now_patients,'-vk');
% hold on



% clc;clear all;
% filename="newKorea.xlsx";
% new_inc=readmatrix(filename,'sheet',1,'range','C2:C77');
% dead=readmatrix(filename,'sheet',1,'range','G2:G77');
% recovery=readmatrix(filename,'sheet',1,'range','F2:F77');
% now_patients=readmatrix(filename,'sheet',1,'range','B2:B77');
% date=zeros(1,76);
% for i=1:76
%     date(i)=i;
% end
% figure(1)
% plot(date,new_inc,'-+y',date,dead,'-*b',date,recovery,'-.r',date,now_patients,'-vk');
% hold on


% clc;clear all;
% filename="newIndia.xlsx";
% new_inc=readmatrix(filename,'sheet',1,'range','C2:C61');
% dead=readmatrix(filename,'sheet',1,'range','G2:G61');
% recovery=readmatrix(filename,'sheet',1,'range','F2:F61');
% now_patients=readmatrix(filename,'sheet',1,'range','B2:B61');
% date=zeros(1,60);
% for i=1:60
%     date(i)=i;
% end
% figure(1)
% plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
% hold on


% clc;clear all;
% filename="newKorea.xlsx";
% % dd=readmatrix(filename,'sheet',1,'range','B2:B77');
% r=readmatrix(filename,'sheet',1,'range','C2:C77');
% d=readmatrix(filename,'sheet',1,'range','D2:D77');
% R=[];
% D=[];
% temp1=0;
% for i=1:76
%     temp1=temp1+r(i);
%     R=[R;temp1];
% end
% 
% temp2=0;
% for i=1:76
%     temp2=temp2+d(i);
%     D=[D;temp2];
% end
% writematrix(R,filename,'sheet',1,'range','F2:F77');
% writematrix(D,filename,'sheet',1,'range','G2:G77');
% now_patients=readmatrix(filename,'sheet',1,'range','I3:I102');
% date=zeros(1,100);
% for i=1:100
%     date(i)=i;
% end
% figure(1)
% plot(date,new_inc,'-+y',date,dead,'-*b',date,recovery,'-.r',date,now_patients,'-vk');
% hold on


% clc;clear all;
% filename="newIndia.xlsx";
% % dd=readmatrix(filename,'sheet',1,'range','B2:B77');
% r=readmatrix(filename,'sheet',1,'range','C2:C61');
% d=readmatrix(filename,'sheet',1,'range','D2:D61');
% R=[];
% D=[];
% temp1=0;
% for i=1:60
%     temp1=temp1+r(i);
%     R=[R;temp1];
% end
% 
% temp2=0;
% for i=1:60
%     temp2=temp2+d(i);
%     D=[D;temp2];
% end
% writematrix(R,filename,'sheet',1,'range','F2:F61');
% writematrix(D,filename,'sheet',1,'range','G2:G61');