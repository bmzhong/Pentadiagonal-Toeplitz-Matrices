clc;
N=[];
time11=[];
time22=[];
time33=[];
time44=[];
rb=[];
rc=[];
rd=[];
n=100;
% set(0,'diary','on');
% set(0,'diaryfile','1.txt');
a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
%  for n=1000:1000:24000
    N=[N,n];
    [det1,time]=system_det(n,a,b,c,d,e,f,g);
    fprintf("(%d論)det: %19.18d\n",n,det1);
    fprintf('timeㄩ%19.18d\n',time/100);
    time11=[time11,time/100];
    fprintf('\n');
    
    average_time=0;
    for i=1:100
        [r22,time]=k_1(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf('(%d論)k1ㄩ%19.18d\n',n,r22);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    fprintf('relative errorㄩ%19.18d\n',abs((r22-det1)/det1));
    time22=[time22,average_time/100];
    rb=[rb,abs((r22-det1)/det1)];
    fprintf('\n');
   
    
    average_time=0;
    for i=1:100
        [k22,time]=k_2(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_2ㄩ%19.18d\n",n,k22);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    fprintf('relative errorㄩ%19.18d\n',abs((k22-det1)/det1));
    time33=[time33,average_time/100];
    rc=[rc,abs((k22-det1)/det1)];
    fprintf('\n');
    
    average_time=0;
    for i=1:100
        [k33,time]=k_3(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_3: %19.18d\n",n,k33);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    time44=[time44,average_time/100];
    fprintf('relative errorㄩ%19.18d\n',abs((k33-det1)/det1));
    rd=[rd,abs((k33-det1)/det1)];
    fprintf('-----------------------------------\n');
%  end
% set(0,'diary','off');
figure(1)
 plot(N,time1,'-or',N,time2,'-sb',N,time3,'-dc',N,time4,'-hm');
figure(2)
 plot(N,rb,'-*g',N,rc,'-sb',N,rd,'-dc');