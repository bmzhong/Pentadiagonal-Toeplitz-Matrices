syms x f
p1 =   2.723e-10 ;
p2 =  -1.303e-07 ;
p3 =   2.608e-05 ;
p4 =   -0.002815;
p5 =      0.1755 ;
p6 =      -6.255 ;
p7 =       116.5 ;
p8 =      -940.7 ;
p9 =        4033;
p10 =       -4370;

f = inline('p1*x^9 + p2*x^8 + p3*x^7 + p4*x^6 +p5*x^5 + p6*x^4 + p7*x^3 + p8*x^2 + p9*x + p10','p1','p2','p3','p4','p5','p6','p7','p8','p9','p10','x');
P=[];
for i=1:100
    temp=f(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,i);
    P=[P,temp];
end
% 
% filename="China.xlsx";
% writematrix(P',filename,'sheet',1,'range','J3:J102');
% date=zeros(1,100);
% for i=1:100
%     date(i)=i;
% end

