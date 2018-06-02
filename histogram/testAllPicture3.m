%这是计算小波阈值去噪与直方图均衡
%包括软硬阈值去噪
clc;
clear all;
% folder = 'F:\databaseOne\';%数据库1
% folder = 'F:\databaseTwo\test\';%数据库清华
folder = 'F:\databaseThree\test\';%数据库山东
files = dir([folder '*.bmp']);%读取文件夹下的所有png或bmp文件
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
reconImage =  erDWT2( inputImage)*255;
  
%加权平均
outputImage=weightedAverage(inputImage,reconImage,1.5,0.9);

MSE_array(i,1) = count_MSE(double(inputImage),double(reconImage));
PSNR_array(i,1) = count_PSNR(double(inputImage/255),double(reconImage/255));

MSE_array(i,2) = count_MSE(double(inputImage),double(outputImage));
PSNR_array(i,2) = count_PSNR(double(inputImage/255),double(outputImage/255));



%写出文件夹下的处理后png文件
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==1
        subplot(211);
        imshow(mat2gray(reconImage));
        subplot(212);
        imshow(mat2gray(outputImage));
    end
end





