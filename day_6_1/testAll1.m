%���Ǽ�������ָ�������ݿ��ֱ��ͼ�����HE AHE CLAHE ���ܵĲ��Դ���
clc;
clear all;
% folder = 'F:\databaseOne\';%���ݿ�1
% folder = 'F:\databaseTwo\';%���ݿ��廪
% folder = 'F:\databaseThree\test\';%���ݿ�ɽ��


folder = 'F:\databaseFour\test\';% �µĿ��廪��ѧROI
%��ȡ�ļ����µ�����png��bmp�ļ�
files = dir([folder '*.png']);
PSNR_array =zeros(length(files),1);
MSE_array =zeros(length(files),1);
LEntropy_array = zeros(length(files),1);
SSIM_array = zeros(length(files),1);
%
for i=1:length(files)-580
    fileaddress = [folder files(i).name];
    inputImage=imread(fileaddress);
%     ��ɫת�Ҷ�ͼ��
%     inputImage=rgb2gray(inputImage);
    outputImage = histogramEq(inputImage);
%     outputImage = adapthisteq(inputImage,'NumTiles',[8,8],'clipLimit',1,'Distribution','uniform','NBins',256);
    PSNR_array(i,1) = count_PSNR(inputImage,outputImage);
    MSE_array(i,1) = count_MSE(inputImage,outputImage);
    LEntropy_array(i,1) = count_LEI(inputImage,outputImage);
    SSIM_array(i,1) = count_SSIM(inputImage,outputImage);
%д���ļ����µĴ����png�ļ�
%����bmpд��һ���ļ�����png
%     imwrite(inputImage,[folder 'test\' 'picture_' num2str(i) '.png'],'png');
%�����д���ļ���_he _ahe 
%     imwrite(inputImage,[folder 'picture_' num2str(i) '_he.png'],'png');
    if i==15 
        subplot(211);
        imshow(inputImage);
        subplot(212);
        imshow(outputImage);
    end
end