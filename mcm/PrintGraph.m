%��ͼ��
%�����й����������¹�����������ͼ��
%����ÿ������������ȷ�����������������������������
%����ͼ�������Ա༭����������������ԣ�
clc;clear all;
filename="China.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','D3:D102');%ÿ��������
dead=readmatrix(filename,'sheet',1,'range','F3:F102');%��������������
recovery=readmatrix(filename,'sheet',1,'range','G3:G102');%��������������
now_patients=readmatrix(filename,'sheet',1,'range','I3:I102');%����ȷ�
date=zeros(1,100);%excel���е���ʼ����2/22�ն�Ӧ���������еĵ�һ��Ԫ��1��
for i=1:100
    date(i)=i;
end
figure(1)%��ͼ
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on

filename="Korea.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','C2:C77');%ÿ��������
dead=readmatrix(filename,'sheet',1,'range','G2:G77');%��������������
recovery=readmatrix(filename,'sheet',1,'range','F2:F77');%��������������
now_patients=readmatrix(filename,'sheet',1,'range','B2:B77');%����ȷ�
date=zeros(1,76);%excel���е���ʼ����2/15�ն�Ӧ���������еĵ�һ��Ԫ��1��
for i=1:76
    date(i)=i;
end
figure(2)
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on

filename="German.xlsx";
new_inc=readmatrix(filename,'sheet',1,'range','B2:B70');%ÿ��������
dead=readmatrix(filename,'sheet',1,'range','C2:C70');%��������������
recovery=readmatrix(filename,'sheet',1,'range','D2:D70');%��������������
now_patients=readmatrix(filename,'sheet',1,'range','G2:G70');%����ȷ�
date=zeros(1,69);%excel���е���ʼ����2/22�ն�Ӧ���������еĵ�һ��Ԫ��1��
for i=1:69
    date(i)=i;
end
figure(3)
plot(date,new_inc,'y',date,dead,'b',date,recovery,'r',date,now_patients,'k');
hold on;