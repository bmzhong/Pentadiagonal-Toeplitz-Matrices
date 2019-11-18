function [det_T,time]=system_det(n,a,b,c,d,e,f,g)
if nargin<8||n<4||d==0
    error('输入参数不合法');
end
d1=linspace(a,a,n);
d2=linspace(b,b,n-1);
d3=linspace(c,c,n-2);
d4=linspace(d,d,n-3);
d5=linspace(e,e,n-1);
d6=linspace(f,f,n-2);
d7=linspace(g,g,n-3);
T=diag(d1,0)+diag(d2,1)+diag(d3,2)+diag(d4,3)+...
  diag(d5,-1)+diag(d6,-2)+diag(d7,-3);
fprintf('条件数%d\n',condest(T));
% disp('条件数');
% disp(cond(T));
tic
det_T=det(T);
time=toc;

% n=1000:49:2000
% a=0.96;b=0.001;c=0.015;d=1;e=0.01;f=0.023;g=0.014;
% 示例矩阵15*15
% T=[ a b c d 0 0 0 0 0 0 0 0 0 0 0;
    %    e a b c d 0 0 0 0 0 0 0 0 0 0;
    %    f e a b c d 0 0 0 0 0 0 0 0 0;
    %    g f e a b c d 0 0 0 0 0 0 0 0;
    %    0 g f e a b c d 0 0 0 0 0 0 0;
    %    0 0 g f e a b c d 0 0 0 0 0 0;
    %    0 0 0 g f e a b c d 0 0 0 0 0;
    %    0 0 0 0 g f e a b c d 0 0 0 0;
    %    0 0 0 0 0 g f e a b c d 0 0 0;
    %    0 0 0 0 0 0 g f e a b c d 0 0;
    %    0 0 0 0 0 0 0 g f e a b c d 0;
    %    0 0 0 0 0 0 0 0 g f e a b c d;
    %    0 0 0 0 0 0 0 0 0 g f e a b c;
    %    0 0 0 0 0 0 0 0 0 0 g f e a b;
    %    0 0 0 0 0 0 0 0 0 0 0 g f e a;
%   ];
%     fprintf("改进后的和det()的绝对误差：%d\n",(det_T1-det_T3));
%     fprintf("改进后的和det()的相对误差：%d\n",(det_T1-det_T3)/det_T3);