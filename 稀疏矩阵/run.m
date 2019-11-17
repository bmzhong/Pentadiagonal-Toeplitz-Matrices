clc;
clear;
n=9000;
a=1.50;b=0.05;c=0.05;d=0.05;e=0.05;f=0.05;g=0.05;
sheet=1;
count=0;
flag=0;
filename='testData2.xlsx';
B=["count", "a", "b", "c", "d", "e", "f", "g","det_T2","time"];
% set(0,'diary','on');
% set(0,'diaryfile',filename);
for j1=1:10
    a=a-0.15;
    b=0.05;
    for j2=1:10
        b=b+0.15;
        d=0.05;
        for j4=1:10
            d=d+0.15;
            e=0.05;
            for j5=1:10
                e=e+0.15;
                f=0.05;
                for j6=1:10
                    f=f+0.15;
                    g=0.05;
                    for j7=1:10
                        g=g+0.15;
                        average_time=0;
                        [det_T1,time]=k_7sparseMatrix(n,a,b,c,d,e,f,g);
                        average_time=average_time+time;
%                         fprintf('(%d阶)没有改进之前的结果：%13.12d\n',n,det_T1);
%                         fprintf('运行50次的平均时间：%13.12d\n',average_time);
%                         fprintf('\n');
%                         average_time=0;
%                         [det_T2,time]=advance(n,a,b,c,d,e,f,g);
%                         average_time=average_time+time;
%                         fprintf("(%d阶)改进之后的结果：%13.12d\n",n,det_T2);
%                         fprintf('运行50次的平均时间：%13.12d\n',average_time);
%                         fprintf('\n');
%                         average_time=0;
%                         [det_T3,time]=system_det(n,a,b,c,d,e,f,g);
%                         average_time=average_time+time;
%                         fprintf("(%d阶)系统det()函数的结果: %13.12d\n",n,det_T3);
%                         fprintf('运行50次的平均时间：%13.12d\n',average_time);
                      
                        if rem(count/1000000,1)==0
                            count=0;
                            clc;
                            sheet=fix(mod(count,10000))+1;
                            writematrix(B,filename,'sheet',sheet,'Range','A1:J1');
                        end
                        count=count+1;
                        if rem(count/1000,1)==0
                            fprintf('%d %f %f %f %f %f %f %f\n',count,a,b,c,e,d,f,g);
                        end
                        A=[count a b c d e f g det_T1 average_time];
                        S=['A',num2str(count+1)];
                        E=['J',num2str(count+1)];
                        L=[S,':',E];
                        writematrix(A,filename,'sheet',sheet,'Range',L);
                        if count>90000000
                            flag=1;
                            break;
                        end
%                         disp('------------------------------------------------------');
                    end
                    if flag==1
                        flag=2;
                        break;
                    end
                end
                if flag==2
                    flag=3;
                    break;
                end
            end
            if flag==3
                flag=4;
                break;
            end
        end
        if flag==4
            flag=5;
            break;
        end
    end
    if flag==5
        flag=6;
        break;
    end
end
set(0,'diary','off');

