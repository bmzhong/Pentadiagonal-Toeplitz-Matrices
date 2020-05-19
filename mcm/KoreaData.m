%获得韩国的拟合后的死亡率和治愈率
function [d,r,Itrue]=KoreaData()
syms Dfunc Rfunc t ;%死亡率拟合函数Dfunc,治愈率拟合函数Rfunc，
%死亡率拟合函数参数
p1 =   -5.63e-16  ;
p2 =   2.014e-13  ;
p3 =   -3.02e-11  ;
p4 =   2.459e-09  ;
p5 =  -1.175e-07  ;
p6 =   3.311e-06  ;
p7 =    -5.2e-05  ;
p8 =   0.0003882  ;
p9 =  -0.0008349  ;
p10 =   0.0004837 ;
%死亡率拟合函数
Dfunc = p1*t^9 + p2*t^8 + p3*t^7 + p4*t^6 +...
    p5*t^5 + p6*t^4 + p7*t^3 + p8*t^2 + p9*t + p10;%获得每个日期的拟合的死亡率
d=zeros(1,76);
for j=1:76
    d(j)=eval(subs(Dfunc,'t',j));%死亡率拟合函数参数
end
q1 =  -1.027e-15  ;
q2 =   3.666e-13  ;
q3 =  -5.762e-11  ;
q4 =   5.075e-09  ;
q5 =  -2.638e-07  ;
q6 =   7.902e-06  ;
q7 =  -0.0001267  ;
q8 =   0.0009923  ;
q9 =   -0.003178  ;
q10 =    0.003283 ;
Rfunc = q1*t^9 + q2*t^8 + q3*t^7 + q4*t^6 +...
    q5*t^5 + q6*t^4 + q7*t^3 + q8*t^2 + q9*t + q10;%每个日期拟合的治愈率
r=zeros(1,76);
for j=1:76
    r(j)=subs(Rfunc,'t',j);
end
filename="Korea.xlsx";
%韩国每个日期的确诊人数
Itrue=readmatrix(filename,'sheet',1,'range','B2:B77');
