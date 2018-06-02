% 方法分解后 CA低频用软阈值去噪，CH,CV,中频极值保留，CD高频硬阈值去噪

clc;
clear all;
inputImage = imread('F:\picture_3.png');
% inputImage = imread('F:\3.bmp');
% inputImage = rgb2gray(inputImage);
%设置小波基函数和阈值类型
wname='haar';
threshType='h';
% 设置尺度向量  
n=[1,2];        
% 设置阈值向量           
p=[4,4];
T1=0.2;
T2=0.2;

%用小波函数haar对图像XX进行2层分解   
[c,l]=wavedec2(inputImage,1,wname);   
a1 = wrcoef2('a',c,l,wname,1);  % 重构第1层图像的近似系数
% as1 = wthresh(a1,'s',T1);%进行阈值处理



d1 = wrcoef2('d',c,l,wname,1);  % 重构第1层图像的高频系数
dh1 = wthresh(d1,'h',T2);%进行阈值处理

v1= wrcoef2('v',c,l,wname,1);
h1= wrcoef2('h',c,l,wname,1);
BWv = imregionalmax(v1);
BWh = imregionalmax(h1);
vm1 = double(BWv).*v1;
hm1 = double(BWh).*h1;

% 图像的二维小波重构  
otsuShow(mat2gray(a1),mat2gray(as1));
% otsuShow(mat2gray(h1),mat2gray(d1));
outputImage = as1 + vm1 + hm1 + dh1;
% otsuShow(inputImage,mat2gray(outputImage));
MSE_1 = count_MSE(double(inputImage),double(outputImage));
PSNR_1 = count_PSNR(double(inputImage/255),double(outputImage/255));

