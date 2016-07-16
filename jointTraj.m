clear
clc

t = 0:0.05:2;
t = t';

start = [0.3, 0.3, 0.6];
midpoint1 = [-0.3, -0.3, 0.3];
midpoint2 = [0.3, -0.3, 0.3];
midpoint3 = [-0.3, 0.3, 0.6];
goal = [0.3, 0.3, 0.6];

%construct the UR5 robot
ur5_L(1) = Link('d', 0.089159, 'a', 0, 'alpha', pi/2);
ur5_L(2) = Link('d', 0, 'a', -0.425, 'alpha', 0);
ur5_L(3) = Link('d', 0, 'a', -0.39225, 'alpha', 0);
ur5_L(4) = Link('d', 0, 'a', 0, 'alpha', pi/2);
ur5_L(5) = Link('d', 0, 'a', 0, 'alpha', -pi/2);
ur5_L(6) = Link('d', 0, 'a', 0, 'alpha', 0);

ur5 = SerialLink(ur5_L, 'name', 'ur5-6axis');
ur5.ikineType = 'puma';

T1 = transl(start);
T2 = transl(midpoint1);
T3 = transl(midpoint2);
T4 = transl(midpoint3);
T5 = transl(goal);

% q1 = ur5.ikine6s(T1);
% q1 = [4.383545 3.212670 1.678350 4.533758 0.328844 0];
% % q2 = ur5.ikine6s(T2);
% q2 = [3.580408 5.163946 1.865197 2.395634 1.131981 0.000000];
% qc1 = jtraj(q2, q1, t);
% 
% Ts1 = ctraj(T2, T3, length(t));
% qc2 = ur5.ikine6s(Ts1);
% 
% q3 = ur5.ikine6s(T3);
% q4 = ur5.ikine6s(T4);
% qc3 = jtraj(q3, q4, t);

Ts2 = ctraj(T4, T5, length(t));
for i=1:length(t)
    reshapeT = reshape(Ts2(:,:,i)',1,16);
    mat(i,:) = reshapeT;
end
[row,col] = size(mat);
mat = reshape(mat',1,row*col);
csvwrite('combinedMat.csv',mat)

% q = [qc1; qc2; qc3];
% 
% while(true)
%     ur5.plot(qc1);
% end






