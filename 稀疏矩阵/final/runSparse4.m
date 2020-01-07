clc
n=100;
a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
r1=[];r2=[];r3=[];
t1=[];t2=[];t3=[];
for n=24000:24000
    tic
    for i=1:50
        det1=sparse4(n,a,b,c,d,e,f,g);
    end
    time1=toc;
    r1=[r1 det1];
    t1=[t1 time1/50];
    disp(n);
    fprintf("paper��%15.12d, ʱ�䣺%15.12d\n",det1,time1/50);
    
    [det2,time2]=system_det(n,a,b,c,d,e,f,g);
    r2=[r2 det2];
    t2=[t2 time2/50];
    fprintf("matab��%15.12d, ʱ�䣺%15.12d\n",det2,time2/50);
    
    [det3,time3]=Gauss_row(n,a,b,c,d,e,f,g);
    r3=[r3 det3];
    t3=[t3 time3/50];
    fprintf("��˹����%15.12d, ʱ�䣺%15.12d\n\n\n",det3,time3/50);
end