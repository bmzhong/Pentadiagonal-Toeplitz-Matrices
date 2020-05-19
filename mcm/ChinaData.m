%获得中国的拟合后的死亡率和治愈率
function [d,r,Itrue]=ChinaData()
syms Dfunc Rfunc t ;%死亡率拟合函数Dfunc,治愈率拟合函数Rfunc，
%死亡率拟合函数参数
p1 =  -4.528e-17;
p2 =  2.162e-14;
p3 =  -4.396e-12;
p4 =  4.981e-10;
p5 =  -3.456e-08;
p6 =  1.517e-06;
p7 =  -4.189e-05;
p8 =  0.0006962;
p9 =  -0.006333;
p10 = 0.02699;
%死亡率拟合函数
Dfunc = p1*t^9 + p2*t^8 + p3*t^7 + p4*t^6 +...
    p5*t^5 + p6*t^4 + p7*t^3 + p8*t^2 + p9*t + p10;
d=zeros(1,100);
for j=1:100
    d(j)=eval(subs(Dfunc,'t',j));%获得每个日期的拟合的死亡率
end
%治愈率拟合函数参数
q1 =  -4.651e-16;
q2 =   2.268e-13;
q3 =  -4.587e-11;
q4 =   5.005e-09;
q5 =  -3.201e-07;
q6 =   1.22e-05;
q7 =  -0.0002698;
q8 =   0.003288;
q9 =   -0.01868;
q10 =  0.03926;
%治愈率拟合函数
Rfunc = q1*t^9 + q2*t^8 + q3*t^7 + q4*t^6 +...
       q5*t^5 + q6*t^4 + q7*t^3 + q8*t^2 + q9*t + q10;
r=zeros(1,100);
for j=1:100
    r(j)=subs(Rfunc,'t',j);%每个日期拟合的治愈率
end
filename="China.xlsx";
%中国每个日期的确诊人数
Itrue=readmatrix(filename,'sheet',1,'range','I3:I102');
