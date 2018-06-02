clear;       
clc;
[X,map]=imread('F:\3.bmp');              
 
X=rgb2gray(X);  
figure(1); 
set(gcf,'Position',[0,0,512,512])
set(gca,'position',[0 0 1 1])
imshow(X); 
title('原始图像');                    
 
wname='haar';
threshType='s';
%用小波函数coif2对图像XX进行2层  
  
% 分解  
  
[c,l]=wavedec2(X,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % 重构第2层图像的近似系数


n=[1,2];        % 设置尺度向量  
              
p=[4,4];% 设置阈值向量
%mse 3.9 psnr 56.3 h
%mse 7.7 psnr 57.414 s
% p=[0.3*255,0.7*255];

nc=wthcoef2('h',c,l,n,p,threshType);     %对高频小波系数进行阈值处理
  
% 图像的二维小波重构  
  
X1=waverec2(nc,l,wname);    %图像的二维小波重构
  
figure(2);   % 显示图像处理之后的结果
set(gcf,'Position',[0,0,512,512]);
set(gca,'position',[0 0 1 1]);
imshow(uint8(X1));               
title(' 第一次消噪后的图像 ');   


mc=wthcoef2('v',nc,l,n,p,threshType);    %再次对高频小波系数进行阈值处理  
% 图像的二维小波重构  
  
X2=waverec2(mc,l,wname);    
figure(3);
set(gcf,'Position',[0,0,512,512]);
set(gca,'position',[0 0 1 1]);
imshow(uint8(X2));                  
title(' 第二次消噪后的图像 ');
xMSE = count_MSE(double(X),double(X2));
xPSNR = count_PSNR(double(X/255),double(X2/255));
% mc=wthcoef2('d',nc,l,n,p,threshType);    %第三次对高频小波系数进行阈值处理  
% % 图像的二维小波重构  
%   
% X3=waverec2(mc,l,wname);    
% figure(4);
% set(gcf,'Position',[0,0,512,512]);
% set(gca,'position',[0 0 1 1]);
% imshow(uint8(X3));                  
% title(' 第三次消噪后的图像 ');



