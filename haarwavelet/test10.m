clear;       
clc;
[X,map]=imread('F:\3.bmp');              
 
X=rgb2gray(X);  
figure(1); 
set(gcf,'Position',[0,0,512,512])
set(gca,'position',[0 0 1 1])
imshow(X); 
title('ԭʼͼ��');                    
 
wname='haar';
threshType='s';
%��С������coif2��ͼ��XX����2��  
  
% �ֽ�  
  
[c,l]=wavedec2(X,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % �ع���2��ͼ��Ľ���ϵ��


n=[1,2];        % ���ó߶�����  
              
p=[4,4];% ������ֵ����
%mse 3.9 psnr 56.3 h
%mse 7.7 psnr 57.414 s
% p=[0.3*255,0.7*255];

nc=wthcoef2('h',c,l,n,p,threshType);     %�Ը�ƵС��ϵ��������ֵ����
  
% ͼ��Ķ�άС���ع�  
  
X1=waverec2(nc,l,wname);    %ͼ��Ķ�άС���ع�
  
figure(2);   % ��ʾͼ����֮��Ľ��
set(gcf,'Position',[0,0,512,512]);
set(gca,'position',[0 0 1 1]);
imshow(uint8(X1));               
title(' ��һ��������ͼ�� ');   


mc=wthcoef2('v',nc,l,n,p,threshType);    %�ٴζԸ�ƵС��ϵ��������ֵ����  
% ͼ��Ķ�άС���ع�  
  
X2=waverec2(mc,l,wname);    
figure(3);
set(gcf,'Position',[0,0,512,512]);
set(gca,'position',[0 0 1 1]);
imshow(uint8(X2));                  
title(' �ڶ���������ͼ�� ');
xMSE = count_MSE(double(X),double(X2));
xPSNR = count_PSNR(double(X/255),double(X2/255));
% mc=wthcoef2('d',nc,l,n,p,threshType);    %�����ζԸ�ƵС��ϵ��������ֵ����  
% % ͼ��Ķ�άС���ع�  
%   
% X3=waverec2(mc,l,wname);    
% figure(4);
% set(gcf,'Position',[0,0,512,512]);
% set(gca,'position',[0 0 1 1]);
% imshow(uint8(X3));                  
% title(' ������������ͼ�� ');



