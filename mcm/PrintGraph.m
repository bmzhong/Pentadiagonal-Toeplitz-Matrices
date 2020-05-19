%画图，
%生成中国、韩国、德国的疫情数据图，
%包含每日新增、现有确诊、现有死亡人数、现有治愈人数，
%生成图后在属性编辑器中设置坐标等属性，
clc;clear all;
filename="China.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','D3:D102');%每日新增，
dead=readmatrix(filename,'sheet',1,'range','F3:F102');%现有死亡人数，
recovery=readmatrix(filename,'sheet',1,'range','G3:G102');%现有治愈人数，
now_patients=readmatrix(filename,'sheet',1,'range','I3:I102');%现有确诊，
date=zeros(1,100);%excel表中的起始日期2/22日对应日期向量中的第一个元素1，
for i=1:100
    date(i)=i;
end
figure(1)%画图
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on

filename="Korea.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','C2:C77');%每日新增，
dead=readmatrix(filename,'sheet',1,'range','G2:G77');%现有死亡人数，
recovery=readmatrix(filename,'sheet',1,'range','F2:F77');%现有治愈人数，
now_patients=readmatrix(filename,'sheet',1,'range','B2:B77');%现有确诊，
date=zeros(1,76);%excel表中的起始日期2/15日对应日期向量中的第一个元素1，
for i=1:76
    date(i)=i;
end
figure(2)
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on

filename="German.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','B2:B70');%每日新增，
dead=readmatrix(filename,'sheet',1,'range','C2:C70');%现有死亡人数，
recovery=readmatrix(filename,'sheet',1,'range','D2:D70');%现有治愈人数，
now_patients=readmatrix(filename,'sheet',1,'range','G2:G70');%现有确诊，
date=zeros(1,69);%excel表中的起始日期2/22日对应日期向量中的第一个元素1，
for i=1:69
    date(i)=i;
end
figure(3)
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on;