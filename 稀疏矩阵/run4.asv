clc;
N=[];
time1=[];
time2=[];
time3=[];
time4=[];
rb=[];
rc=[];
rd=[];
set(0,'diary','on');
set(0,'diaryfile','1.txt');
a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
 for n=1000:1000:24000
    N=[N,n];
    [det,time]=system_det(n,a,b,c,d,e,f,g);
    fprintf("(%d論)det: %19.18d\n",n,det);
    fprintf('timeㄩ%19.18d\n',time/100);
    time1=[time1,time/100];
    fprintf('\n');
    
    average_time=0;
    for i=1:100
        [r2,time]=k_1(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf('(%d論)k1ㄩ%19.18d\n',n,r2);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    fprintf('relative errorㄩ%19.18d\n',abs((r2-det)/det));
    time2=[time2,average_time/100];
    rb=[rb,abs((r2-det)/det)];
    fprintf('\n');
   
    
    average_time=0;
    for i=1:100
        [k2,time]=k_2(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_2ㄩ%19.18d\n",n,k2);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    fprintf('relative errorㄩ%19.18d\n',abs((k2-det)/det));
    time3=[time3,average_time/100];
    rc=[rc,abs((k2-det)/det)];
    fprintf('\n');
    
    average_time=0;
    for i=1:100
        [k3,time]=k_3(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_3: %19.18d\n",n,k3);
    fprintf('timeㄩ%19.18d\n',average_time/100);
    time4=[time4,average_time/100];
    fprintf('relative errorㄩ%19.18d\n',abs((k3-det)/det));
    rd=[rd,abs((k3-det)/det)];
    fprintf('-----------------------------------\n');
 end
set(0,'diary','off');
figure(1)
 plot(N,time1,'-or',N,time2,'-sb',N,time3,'-dc',N,time4,'-hm');
figure(2)
 plot(N,rb,'-*g',N,rc,'-sb',N,rd,'-dc');