% syms k f1 f2
% f1=(11*36)*log2(k);
% f2=33*k-180;
% figure(1)
% fplot(f1,[0,200]);
% hold on
% fplot(f2,[0,200]);
% hold on
% n=1000;
% syms f k;
% f=198*floor((n-6)/k)+(11*36)*log2(k)+(11*36)*log2(n-6-k*floor((n-6)/k));
% subs(f,300)
% figure(1)
% fplot(f,[6,51])
% hold on
a=[];b=[];
n=10000;
for k=1:12:300
    r=n-6-k*floor((n-6)/k);
    if r==0
        r=1;
    end
    f=198*floor((n-6)/k)+(11*36)*log2(k)+(11*36)*log2(r);
    a=[a,f];
    b=[b,k];
end
figure(1)
scatter(b,a,"*");
hold on
