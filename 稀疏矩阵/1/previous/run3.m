clc;
% for n=6000:100:7000
n=25000;
  a=2;b=1;c=1;d=1;e=1;f=1;g=1;
     average_time=0;
%     for i=1:50
        [det_T3,time]=system_det(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d阶)det(): %13.12d\n",n,det_T3);
    fprintf('time：%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
%     for i=1:50
        [det_T1,time]=k(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf('(%d阶)k：%13.12d\n',n,det_T1);
    fprintf('运行50次的平均时间：%13.12d\n',average_time/50);
    fprintf('\n');
    
    average_time=0;
%     for i=1:50
        [det_T2,time]=k_1(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d阶)k1%13.12d\n",n,det_T2);
    fprintf('time：%13.12d\n',average_time/50);
    fprintf('\n');
    
     average_time=0;
%     for i=1:50
        [det_T2,time]=k_2(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d阶)k2%13.12d\n",n,det_T2);
    fprintf('time：%13.12d\n',average_time/50);
    fprintf('\n');
    
         average_time=0;
%     for i=1:50
        [det_T2,time]=k_3(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
%     end
    fprintf("(%d阶)k3%13.12d\n",n,det_T2);
    fprintf('time：%13.12d\n',average_time/50);
    fprintf('\n');
   
    disp('------------------------------------------------------');
% end
