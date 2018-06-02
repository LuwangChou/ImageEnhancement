%这是计算和测试小波去噪的总的代码
%包括软硬阈值去噪
clc;
clear all;
% folder = 'F:\databaseOne\';%数据库1
% folder = 'F:\databaseTwo\test\';%数据库清华
% folder = 'F:\databaseThree\test\';%数据库山东
% files = dir([folder '*.bmp']);%读取文件夹下的所有png或bmp文件
% files = dir([folder '*.png']);
PSNR_array =zeros(length(files),2);
MSE_array =zeros(length(files),2);


%设置小波基函数和阈值类型
wname='haar';
threshType='h';
% 设置尺度向量  
n=[1,2];        
% 设置阈值向量           
p=[4,4];



for i=1:length(files)
    fileaddress = [folder files(i).name];
    inputImage=imread(fileaddress);
%     彩色转灰度图像
    inputImage=rgb2gray(inputImage);


%用小波函数haar对图像XX进行2层   
[c,l]=wavedec2(inputImage,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % 重构第2层图像的近似系数

nc=wthcoef2('h',c,l,n,p,threshType);     %对高频小波系数进行阈值处理
  
% 图像的二维小波重构  
outputImage1=waverec2(nc,l,wname);    %图像的二维小波重构
MSE_array(i,1) = count_MSE(double(inputImage),double(outputImage1));
PSNR_array(i,1) = count_PSNR(double(inputImage/255),double(outputImage1/255));


mc=wthcoef2('v',nc,l,n,p,threshType);    %再次对高频小波系数进行阈值处理  
 
outputImage2=waverec2(mc,l,wname);   % 图像的二维小波重构    
MSE_array(i,2) = count_MSE(double(inputImage),double(outputImage2));
PSNR_array(i,2) = count_PSNR(double(inputImage/255),double(outputImage2/255));

%写出文件夹下的处理后png文件
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==length(files)
        subplot(211);
        imshow(mat2gray(inputImage));
        subplot(212);
        imshow(mat2gray(outputImage1));
    end
end





