
f=@getfunction;

% g = matlabFunction(f);
% disp(g)
x0=[0.2,0.3,0.5,0.14,0.4,0.1];
x=fminunc(f,x0)
