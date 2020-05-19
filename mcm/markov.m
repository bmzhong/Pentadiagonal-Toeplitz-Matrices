clear
syms a u;
c=[a,u]';%构成矩阵
filename="China.xlsx";
%中国每个日期的确诊人数
A=readmatrix(filename,'sheet',1,'range','I3:I102');
A = A';
Ago=cumsum(A);%原始数据一次累加,得到1-AGO序列xi(1)。
n=length(A);%原始数据个数
for k=1:(n-1)
    Z(k)=(Ago(k)+Ago(k+1))/2; %Z(i)为xi(1)的紧邻均值生成序列
end
Yn =A;%Yn为常数项向量
Yn(1)=[]; %从第二个数开始，即x(2),x(3)...
Yn=Yn';
E=[-Z;ones(1,n-1)]';%累加生成数据做均值
c=(E'*E)\(E'*Yn);%利用公式求出a，u
c= c';
a=c(1);%得到a的值
u=c(2);%得到u的值
F=[];
F(1)=A(1);
for k=2:(n)
    F(k)=(A(1)-u/a)/exp(a*(k-1))+u/a;%求出GM(1,1)模型公式
end
G=[];
G(1)=A(1);
for k=2:(n)
    G(k)=F(k)-F(k-1);%两者做差还原原序列，得到预测数据
end
t1=1:n;
t2=1:n;
% plot(t1,A,'bo--');
% hold on;
% plot(t2,G,'r*-');
% title('预测结果');
% legend('真实值','预测值');
e=A-G;
q=e/A;
s1=var(A);
s2=var(e);
c=s2/s1;
len=length(e);
p=0;
for i=1:len
    if(abs(e(i))<0.6745*s1)
        p=p+1;
    end
end
p=p/len;
rng('default');


dim=[2,30000];
Nclst=3;
k=dim(1);
N=dim(2);
Aerr=1e-4;
A0real = [0.2, 0.3, 0.5];
Areal = [0.8, 0.1, 0.1;...
    0.2, 0.7, 0.1;...
    0.0, 0.5, 0.5];
mureal = [1 2; -4 2; 7 1]';
sigreal=zeros(k,k,Nclst);
sigreal(:,:,1)=[2 -1.5; -1.5 2];
sigreal(:,:,2)=[5 -2.; -2. 3];
sigreal(:,:,3)=[1 0.1; 0.1 2];
zreal=zeros(1,dim(2));
zreal(1)=randsrc(1,1,[1:Nclst;A0real]);
x=zeros(dim);
x(:,1)=funGaussSample(mureal(:,zreal(1)),squeeze(sigreal(:,:,zreal(1))),1);
for ii=2:dim(2)
    zreal(ii)=randsrc(1,1,[1:Nclst;Areal(zreal(ii-1),:)]);
    x(:,ii)=funGaussSample(mureal(:,zreal(ii)),squeeze(sigreal(:,:,zreal(ii))),1);
end
mu = zeros(k,Nclst);
sig = zeros(k,k,Nclst);
z = zeros(Nclst,N);
tmp_k_idx1=zeros(1,Nclst);
mu_kmeans=zeros(k, Nclst);
for ii=1:Nclst
    idx=(k_idx==ii);
    tmp_mu=mean(x(:,idx),2);
    dist=sum((repmat(tmp_mu,1,Nclst)-mureal).^2);
    [dummy,tmp_idx]=min(dist);
    mu_kmeans(:,tmp_idx)=tmp_mu;
    mu(:,tmp_idx)=tmp_mu;
    sig(:,:,tmp_idx)=cov(x(:,idx)');
    tmp_k_idx1(ii)=tmp_idx;
end
tmp_k_idx2=k_idx;
for ii=1:Nclst
    k_idx(tmp_k_idx2==ii)=tmp_k_idx1(ii);
end
mu_GMM = zeros(k,Nclst);
sig_GMM = zeros(k,k,Nclst);
for ii=1:Nclst
    idx=(k_idx_GMM==ii);
    tmp_mu=mean(x(:,idx),2);
    dist=sum((repmat(tmp_mu,1,Nclst)-mureal).^2);
    [dummy,tmp_idx]=min(dist);
    mu_GMM(:,tmp_idx)=tmp_mu;
    sig_GMM(:,:,tmp_idx)=cov(x(:,idx)');
    tmp_k_idx1(ii)=tmp_idx;
end
tmp_k_idx2=k_idx_GMM;
for ii=1:Nclst
    k_idx_GMM(tmp_k_idx2==ii)=tmp_k_idx1(ii);
end
for ii=1:N
    z(k_idx(ii),ii)=1;
end
tmp = rand(1,Nclst);
A0 = tmp/sum(tmp);
tmp = rand(Nclst, Nclst);
A = tmp./repmat(sum(tmp,2),1,Nclst);
alp_caret = zeros(Nclst, N);
c=zeros(1,N);
Pzx=zeros(Nclst,N);
bet_caret = zeros(Nclst, N);
bet_caret(:,N) = ones(Nclst, 1);
gama = zeros(Nclst,N);
xi = zeros(Nclst,Nclst,N-1);
Aold=ones(size(A))/Nclst;
for ii=1:100
    for jj=1:Nclst
        Pzx(jj,:)=mvnpdf(x',mu(:,jj)',squeeze(sig(:,:,jj)))';
    end
    tmp1=A0'.*Pzx(:,1);
    c(1)=sum(tmp1);
    alp_caret(:,1)=tmp1/c(1);
    for kk=2:N
        tmp1=alp_caret(:,kk-1)'*A;
        tmp2=tmp1'.*Pzx(:,kk);
        c(kk)=sum(tmp2);
        alp_caret(:,kk)=tmp2/c(kk);
    end
    for kk=N:-1:2
        tmp2=A*(Pzx(:,kk).*bet_caret(:,kk));
        bet_caret(:,kk-1)=tmp2/c(kk);
    end
    gama = alp_caret.*bet_caret;
    for jj=1:N-1
        xi(:,:,jj)=alp_caret(:,jj)/c(jj+1)*...
            (Pzx(:,jj+1).*bet_caret(:,jj+1))'.*A;
    end
    A0=gama(:,1)'/sum(gama(:,1));
    A=sum(xi,3)./repmat(sum(sum(xi,3),2),1,Nclst);
    mu=x*gama'./repmat(transpose(sum(gama,2)),k,1);
    for kk=1:Nclst
        sig(:,:,kk)=(repmat(gama(kk,:),k,1).*(x-repmat(mu(:,kk),1,N)))*...
            (x-repmat(mu(:,kk),1,N))'/sum(gama(kk,:));
    end
    iter_err=sum(sum(abs(A-Aold)))/Nclst;
    Aold=A;
    fprintf('loop %2d, A error: %4.2e \n', ii, iter_err);
    if iter_err<Aerr
        break;
    end
end
for jj=1:Nclst
    Pzx(jj,:)=mvnpdf(x',mu(:,jj)',squeeze(sig(:,:,jj)))';
end
w = zeros(Nclst,N);
psi = zeros(Nclst, N-1);
zpred=zeros(1,N);
w(:,1)=log(A0')+log(Pzx(:,1));
for ii=1:N-1
    tmp_1=log(A)+repmat(w(:,ii),1,Nclst);
    [tmp_max, tmp_idx]=max(tmp_1, [], 1);
    w(:,ii+1)=log(Pzx(:,ii+1))+tmp_max';
    psi(:,ii)=tmp_idx';
end
[dummy, tmp_idx]=max(w(:,N));
zpred(N)=tmp_idx;
for ii=N-1:-1:1
    zpred(ii)=psi(zpred(ii+1),ii);
end
errrate_HMM=sum(abs(zpred-zreal)>0.5)*1.0/N;
for ii=1:Nclst
    mu(:,ii)=mean(x(:,zpred==ii),2);
end