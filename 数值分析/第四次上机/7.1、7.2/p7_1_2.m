format long
fname=inline('sqrt(1-exp(-x))/x');
t=trapz(fname,0.0016,1,10)