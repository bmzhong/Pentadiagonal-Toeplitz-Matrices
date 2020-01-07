clc
clear
n=100;
 a=0.5;b=1;c=1;d=1;e=1;f=1;g=1;
 
det1=sparse4(n,a,b,c,d,e,f,g);
fprintf("Öµ£º%15.12d\n",det1);

det2=syst(n,a,b,c,d,e,f,g);
fprintf("Öµ£º%15.12d\n",det2);

det3=Gau(n,a,b,c,d,e,f,g);
fprintf("Öµ£º%15.12d\n",det3);