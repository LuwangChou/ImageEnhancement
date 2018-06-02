%���Ǽ�������ָ�������ݿ��ֱ��ͼ�����HE AHE CLAHE ���ܵĲ��Դ���
clc;
clear all;
folder = 'F:\databaseOne\';%���ݿ�1
% folder = 'F:\databaseTwo\test\';%���ݿ��廪
% folder = 'F:\databaseThree\test\';%���ݿ�ɽ��
% files = dir([folder '*.bmp']);%��ȡ�ļ����µ�����png��bmp�ļ�
files = dir([folder '*.png']);
PSNR_array =zeros(length(files),1);
MSE_array =zeros(length(files),1);
LEntropy_array = zeros(length(files),1);
SSIM_array = zeros(length(files),1);
%
for i=1:length(files)
    fileaddress = [folder num2str(i) files(i).name];
    inputImage=imread(fileaddress);
%     ��ɫת�Ҷ�ͼ��
%     inputImage=rgb2gray(inputImage);
%     outputImage = histeq(inputImage);
    outputImage = adapthisteq(inputImage,'NumTiles',[8,8],'clipLimit',1,'Distribution','uniform','NBins',256);
%     imwrite(outputImage,[heqFolder 'picture_' num2str(i) '_histeq.png'],'png');
    PSNR_array(i,1) = count_PSNR(inputImage,outputImage);
    MSE_array(i,1) = count_MSE(inputImage,outputImage);
    LEntropy_array(i,1) = count_LEI(inputImage,outputImage);
    SSIM_array(i,1) = count_SSIM(inputImage,outputImage);
%д���ļ����µĴ����png�ļ�
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==( length(files) - 5 )
        subplot(211);
        imshow(inputImage);
        subplot(212);
        imshow(outputImage);
    end
end





