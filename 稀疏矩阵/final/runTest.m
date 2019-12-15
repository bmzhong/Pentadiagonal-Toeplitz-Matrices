n=100;
a=2;b=0.2;c=0.1;d=1;e=2;f=5;g=0.5;

tic
det1=sparse4(n,a,b,c,d,e,f,g);
time1=toc;
fprintf("Öµ£º%15.12d\n",det1);

det2=syst(n,a,b,c,d,e,f,g);
fprintf("Öµ£º%15.12d\n",det2)