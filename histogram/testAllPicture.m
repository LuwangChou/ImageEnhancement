%这是计算三个指静脉数据库的直方图均衡的HE AHE CLAHE 等总的测试代码
clc;
clear all;
folder = 'F:\databaseOne\';%数据库1
% folder = 'F:\databaseTwo\test\';%数据库清华
% folder = 'F:\databaseThree\test\';%数据库山东
% files = dir([folder '*.bmp']);%读取文件夹下的所有png或bmp文件
files = dir([folder '*.png']);
PSNR_array =zeros(length(files),1);
MSE_array =zeros(length(files),1);
LEntropy_array = zeros(length(files),1);
SSIM_array = zeros(length(files),1);
%
for i=1:length(files)
    fileaddress = [folder num2str(i) files(i).name];
    inputImage=imread(fileaddress);
%     彩色转灰度图像
%     inputImage=rgb2gray(inputImage);
%     outputImage = histeq(inputImage);
    outputImage = adapthisteq(inputImage,'NumTiles',[8,8],'clipLimit',1,'Distribution','uniform','NBins',256);
%     imwrite(outputImage,[heqFolder 'picture_' num2str(i) '_histeq.png'],'png');
    PSNR_array(i,1) = count_PSNR(inputImage,outputImage);
    MSE_array(i,1) = count_MSE(inputImage,outputImage);
    LEntropy_array(i,1) = count_LEI(inputImage,outputImage);
    SSIM_array(i,1) = count_SSIM(inputImage,outputImage);
%写出文件夹下的处理后png文件
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==( length(files) - 5 )
        subplot(211);
        imshow(inputImage);
        subplot(212);
        imshow(outputImage);
    end
end





