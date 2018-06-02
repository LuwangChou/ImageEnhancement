%���Ǽ���С����ֵȥ����ֱ��ͼ����
%������Ӳ��ֵȥ��
clc;
clear all;
% folder = 'F:\databaseOne\';%���ݿ�1
% folder = 'F:\databaseTwo\test\';%���ݿ��廪
folder = 'F:\databaseThree\test\';%���ݿ�ɽ��
files = dir([folder '*.bmp']);%��ȡ�ļ����µ�����png��bmp�ļ�
% files = dir([folder '*.png']);
PSNR_array =zeros(length(files),2);
MSE_array =zeros(length(files),2);


%����С������������ֵ����
wname='haar';
threshType='h';
% ���ó߶�����  
n=[1,2];        
% ������ֵ����           
p=[4,4];



for i=1:length(files)
    fileaddress = [folder files(i).name];
    inputImage=imread(fileaddress);
%     ��ɫת�Ҷ�ͼ��
    inputImage=rgb2gray(inputImage);
reconImage =  erDWT2( inputImage)*255;
  
%��Ȩƽ��
outputImage=weightedAverage(inputImage,reconImage,1.5,0.9);

MSE_array(i,1) = count_MSE(double(inputImage),double(reconImage));
PSNR_array(i,1) = count_PSNR(double(inputImage/255),double(reconImage/255));

MSE_array(i,2) = count_MSE(double(inputImage),double(outputImage));
PSNR_array(i,2) = count_PSNR(double(inputImage/255),double(outputImage/255));



%д���ļ����µĴ����png�ļ�
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==1
        subplot(211);
        imshow(mat2gray(reconImage));
        subplot(212);
        imshow(mat2gray(outputImage));
    end
end





