function createfigure(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 03-Dec-2019 17:06:41 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'DisplayName','标准正态分布','MarkerSize',8,'Marker','+');

% 创建 xlabel
xlabel({''});

box(axes1,'on');
grid(axes1,'on');
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.142105962077395 0.85098871170927 0.122803516090868 0.0529661027051634]);

