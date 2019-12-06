filename='testData3.xlsx';
sheet=1;
% B=["n","det_T1","det_T2","det_T3","T1time","T2time","T3time"];
% writematrix(B,filename,'sheet',sheet,'Range','A1:G1');
row=93;
for n=1000:1000:10000
    a=0.90;b=0.96;c=1.22;d=0.2;e=0.99;f=0.95;g=0.1;
    average_time_T1=0;
    %     for i=1:50
    [det_T1,time]=k_7sparseMatrix(n,a,b,c,d,e,f,g);
    average_time_T1=average_time_T1+time;
    %     end
    fprintf('(%d��)û�иĽ�֮ǰ�Ľ����%13.12d\n',n,det_T1);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time_T1/50);
    fprintf('\n');
    
    average_time_T2=0;
    %     for i=1:50
    [det_T2,time]=advance(n,a,b,c,d,e,f,g);
    average_time_T2=average_time_T2+time;
    %     end
    fprintf("(%d��)�Ľ�֮��Ľ����%13.12d\n",n,det_T2);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time_T2/50);
    fprintf('\n');
    
    average_time_T3=0;
    %     for i=1:50
    [det_T3,time]=system_det(n,a,b,c,d,e,f,g);
    average_time_T3=average_time_T3+time;
    %     end
    fprintf("(%d��)ϵͳdet()�����Ľ��: %13.12d\n",n,det_T3);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time_T3/50);
    A=[n ,det_T1,det_T2,det_T3,average_time_T1/50,average_time_T2/50,average_time_T3/50];
    S=['A',num2str(row)];
    E=['G',num2str(row)];
    L=[S,':',E];
    writematrix(A,filename,'sheet',sheet,'Range',L);
    row=row+1;
    %     fprintf("�Ľ���ĺ�det()�ľ�����%d\n",(det_T1-det_T3));
    %     fprintf("�Ľ���ĺ�det()�������%d\n",(det_T1-det_T3)/det_T3);
    disp('------------------------------------------------------');
end
% n=1000:49:2000
%     a=0.90;b=0.96;c=1.22;d=0.2;e=0.99;f=0.95;g=0.1;
%  a=0.90;b=0.96;c=1.22;d=0.2;e=0.99;f=0.95;g=0.1;
% ʾ������15*15
% T=[a b c d 0 0 0 0 0 0 0 0 0 0 0;
%    e a b c d 0 0 0 0 0 0 0 0 0 0;
%    f e a b c d 0 0 0 0 0 0 0 0 0;
%    g f e a b c d 0 0 0 0 0 0 0 0;
%    0 g f e a b c d 0 0 0 0 0 0 0;
%    0 0 g f e a b c d 0 0 0 0 0 0;
%    0 0 0 g f e a b c d 0 0 0 0 0;
%    0 0 0 0 g f e a b c d 0 0 0 0;
%    0 0 0 0 0 g f e a b c d 0 0 0;
%    0 0 0 0 0 0 g f e a b c d 0 0;
%    0 0 0 0 0 0 0 g f e a b c d 0;
%    0 0 0 0 0 0 0 0 g f e a b c d;
%    0 0 0 0 0 0 0 0 0 g f e a b c;
%    0 0 0 0 0 0 0 0 0 0 g f e a b;
%    0 0 0 0 0 0 0 0 0 0 0 g f e a;
%   ];
