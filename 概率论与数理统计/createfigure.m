function createfigure(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x ���ݵ�����
%  Y1:  y ���ݵ�����

%  �� MATLAB �� 03-Dec-2019 17:06:41 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'DisplayName','��׼��̬�ֲ�','MarkerSize',8,'Marker','+');

% ���� xlabel
xlabel({''});

box(axes1,'on');
grid(axes1,'on');
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.142105962077395 0.85098871170927 0.122803516090868 0.0529661027051634]);

