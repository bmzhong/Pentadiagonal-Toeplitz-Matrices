%获得德国的拟合后的死亡率和治愈率
function [d,r,Itrue]=GermanData()
syms Dfunc Rfunc t ;%死亡率拟合函数Dfunc,治愈率拟合函数Rfunc，
%死亡率拟合函数参数
p1 =   1.739e-16  ;
p2 =  -4.654e-14  ;
p3 =   5.039e-12  ;
p4 =  -2.826e-10  ;
p5 =   8.728e-09  ;
p6 =  -1.478e-07  ;
p7 =    1.39e-06  ;
p8 =    -7.1e-06  ;
p9 =   1.785e-05  ;
p10 =  -1.631e-05 ;
%死亡率拟合函数
Dfunc = p1*t^9 + p2*t^8 + p3*t^7 + p4*t^6 +...
    p5*t^5 + p6*t^4 + p7*t^3 + p8*t^2 + p9*t + p10;%获得每个日期的拟合的死亡率
d=zeros(1,69);
for j=1:69
    d(j)=eval(subs(Dfunc,'t',j));
end
%治愈率拟合函数参数
q1 =   1.019e-14  ;
q2 =  -3.132e-12  ;
q3 =   4.009e-10  ;
q4 =  -2.766e-08  ;
q5 =   1.112e-06  ;
q6 =  -2.638e-05  ;
q7 =   0.0003603  ;
q8 =   -0.002651  ;
q9 =    0.009165  ;
q10 =   -0.01022  ;
%治愈率拟合函数
Rfunc = q1*t^9 + q2*t^8 + q3*t^7 + q4*t^6 +...
    q5*t^5 + q6*t^4 + q7*t^3 + q8*t^2 + q9*t + q10;%每个日期拟合的治愈率
r=zeros(1,69);
for j=1:69
    r(j)=subs(Rfunc,'t',j);
end
filename="German.xlsx";
%德国每个日期的确诊人数
Itrue=readmatrix(filename,'sheet',1,'range','G2:G70');
