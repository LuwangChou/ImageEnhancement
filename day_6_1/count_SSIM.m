function outputSSIM = count_SSIM( X,Y )
% 计算SSIM的值
% 输入为输入图像，重建图像
%公式为SSIM = L*C*S
% L = 
% ux=mean(mean(X,1),2);
% sigmax=count_StdDev
%
%u 求平均值
ux=mean(mean(X,1),2);
uy=mean(mean(Y,1),2);
%sigma 标准差
sigmax= count_StdDev(X);
sigmay= count_StdDev(Y);

%计算协方差
hhxy = count_Covar(X, Y);
%常数c1,c2,c3
k1=0.01;k2=0.03;L=255;
c1=(k1*L)^2;
c2=(k2*L)^2;
c3=c2/2;


L = (2* ux * uy + c1)/(ux^2 + uy^2 + c1);
C = (2* sigmax * sigmay + c2)/(sigmax^2 + sigmay^2 + c2);
S = (hhxy + c3)/(sigmax * sigmay + c3);

outputSSIM = L*C*S;

end
