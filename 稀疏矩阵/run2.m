
% for n=1000:99:10000
    n=9000;
    a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
%       a=0.96;b=0.001;c=0.015;d=1;e=0.01;f=0.023;g=0.014;
    average_time=0;
%     for i=1:50
        [det_T1,time]=k_7sparseMatrix(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf('(%d��)û�иĽ�֮ǰ�Ľ����%13.12d\n',n,det_T1);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
%     for i=1:50
        [det_T2,time]=advance(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d��)�Ľ�֮��Ľ����%13.12d\n",n,det_T2);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
%     for i=1:50
        [det_T3,time]=system_det(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d��)ϵͳdet()�����Ľ��: %13.12d\n",n,det_T3);
    fprintf('����50�ε�ƽ��ʱ�䣺%13.12d\n',average_time/50);

%     fprintf("�Ľ���ĺ�det()�ľ�����%d\n",(det_T1-det_T3));
%     fprintf("�Ľ���ĺ�det()�������%d\n",(det_T1-det_T3)/det_T3);
    disp('------------------------------------------------------');
% end
% n=1000:49:2000
% 1.0  a=0.90;b=0.96;c=1.22;d=0.2;e=0.99;f=0.95;g=0.1;
% 2.0  a=1;b=1.119;c=1.01;d=1.11;e=0.99;f=0.95;g=0.1;
% 3.0  a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
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