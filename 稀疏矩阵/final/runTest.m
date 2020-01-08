clc;
for n=6000:3000:18000
    a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
    % a=1;b=0.01;c=0.015;d=1;e=0.01;f=0.02;g=0;
    % a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
    
    
    det1=sparse4(n,a,b,c,d,e,f,g);
    fprintf("Öµ£º%15.12d\n",det1);
    
    det2=syst(n,a,b,c,d,e,f,g);
    fprintf("Öµ£º%15.12d\n",det2);
    
    det3=Gau(n,a,b,c,d,e,f,g);
    fprintf("Öµ£º%15.12d %15.12d\n\n",det3);
    disp("                                                                   ")
    disp("-----------------------------------------------");
end
