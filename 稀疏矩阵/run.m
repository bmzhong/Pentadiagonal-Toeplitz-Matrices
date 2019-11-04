clc;
for n=1000:99:10000
    a=0.96;b=0.001;c=0.015;d=1;e=0.01;f=0.023;g=0.014;
    average_time=0;
    for i=1:50
        [det_T1,time]=k_7sparseMatrix(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf('(%d阶)没有改进之前的结果：%13.12d\n',n,det_T1);
    fprintf('运行50次的平均时间：%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
    for i=1:50
        [det_T2,time]=advance(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d阶)改进之后的结果：%13.12d\n",n,det_T2);
    fprintf('运行50次的平均时间：%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
    for i=1:50
        [det_T3,time]=system_det(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d阶)系统det()函数的结果: %13.12d\n",n,det_T3);
    fprintf('运行50次的平均时间：%13.12d\n',average_time/50);

%     fprintf("改进后的和det()的绝对误差：%d\n",(det_T1-det_T3));
%     fprintf("改进后的和det()的相对误差：%d\n",(det_T1-det_T3)/det_T3);
    disp('------------------------------------------------------');
end
% n=1000:49:2000
% a=0.96;b=0.001;c=0.015;d=0.79;e=0.01;f=0.023;g=0.014;
% 示例矩阵15*15
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