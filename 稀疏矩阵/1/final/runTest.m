clc
%     a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
    % a=1;b=0.01;c=0.015;d=1;e=0.01;f=0.02;g=0;
    % a=1;b=1.119;c=1.01;d=1;e=1.17;f=0.95;g=0.1;
    n=100;
    a=2;b=0.2;c=0.6;d=2;e=0.8;f=0.4;g=0.2;

    
    
    det1=finalAlgorithm(n,a,b,c,d,e,f,g,100);
    fprintf("Öµ£º%15.12d\n",det1);
    
    det2=syst(n,a,b,c,d,e,f,g);
    fprintf("Öµ£º%15.12d\n",det2);
    
    det3=Gau(n,a,b,c,d,e,f,g);
    fprintf("Öµ£º%15.12d %15.12d\n\n",det3);
    disp("                                                                   ")
    disp("-----------------------------------------------");
