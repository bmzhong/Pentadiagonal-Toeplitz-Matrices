clc;
N=[];
time1=[];
time2=[];
time3=[];
time4=[];
time5=[];
ra=[];
rb=[];
rc=[];
rd=[];
a=2;b=1;c=1;d=1;e=1;f=1;g=1;
 for n=21000:2000:23000
    N=[N,n];
    average_time=0;
    for i=1:100
        [det,time]=system_det(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)det: %13.12d\n",n,det);
    fprintf('timeㄩ%13.12d\n',average_time/100);
    time1=[time1,average_time/100];
    fprintf('\n');
    
    average_time=0;
    for i=1:100
        [r2,time]=k_1(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf('(%d論)k1ㄩ%13.12d\n',n,r2);
    fprintf('timeㄩ%13.12d\n',average_time/100);
    fprintf('absolute errorㄩ%13.12d\n',abs((r2-det)/det));
    time3=[time3,average_time/100];
    rb=[rb,abs((r2-det)/det)];
    fprintf('\n');
   
    
    average_time=0;
    for i=1:100
        [k2,time]=k_2(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_2ㄩ%13.12d\n",n,k2);
    fprintf('timeㄩ%13.12d\n',average_time/100);
    fprintf('absolute errorㄩ%13.12d\n',abs((k2-det)/det));
    time4=[time4,average_time/100];
    rc=[rc,abs((k2-det)/det)];
    fprintf('\n');
    
    average_time=0;
    for i=1:50
        [k3,time]=k_3(n,a,b,c,d,e,f,g);
        average_time=average_time+time;
    end
    fprintf("(%d論)k_3: %13.12d\n",n,k3);
    fprintf('timeㄩ%13.12d\n',average_time/100);
    time5=[time5,average_time/100];
    fprintf('absolute errorㄩ%13.12d\n',abs((k3-det)/det));
    rd=[rd,abs((k3-det)/det)];
    fprintf('-----------------------------------\n');
 end
figure(1)
 plot(N,time1,'-or',N,time3,'-sb',N,time4,'-dc',N,time5,'-hm');
figure(2)
 plot(N,rb,'-*g',N,rc,'-sb',N,rd,'-dc');