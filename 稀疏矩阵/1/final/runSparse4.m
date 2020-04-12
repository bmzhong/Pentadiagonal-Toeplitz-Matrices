
% a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
a=1;b=0.01;c=0.015;d=1;e=0.01;f=0.02;g=0;
%  a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
r1=[];r2=[];r3=[];
t1=[];t2=[];t3=[];
for n=200:3000:200
    tic
    for i=1:50
        det1=finalAlgorithm(n,a,b,c,d,e,f,g,50);
    end
    time1=toc;
    r1=[r1 det1];
    t1=[t1 time1/50];
    disp(n);
    fprintf("paper：%15.12d, 时间：%15.12d\n",det1,time1/50);
%     
%     [det2,time2]=system_det(n,a,b,c,d,e,f,g);
%     r2=[r2 det2];
%     t2=[t2 time2/50];
%     fprintf("matab：%15.12d, 时间：%15.12d\n",det2,time2/50);
%     
%     tic
%     for i=1:50
%         det3=Gauss_row(n,a,b,c,d,e,f,g);
%     end
%     time3=toc;
%     r3=[r3 det3];
%     t3=[t3 time3/50];
%     fprintf("高斯法：%15.12d, 时间：%15.12d\n\n\n",det3,time3/50);
end