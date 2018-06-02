%���Ǽ���Ͳ���С��ȥ����ܵĴ���
%������Ӳ��ֵȥ��
clc;
clear all;
% folder = 'F:\databaseOne\';%���ݿ�1
% folder = 'F:\databaseTwo\test\';%���ݿ��廪
% folder = 'F:\databaseThree\test\';%���ݿ�ɽ��
% files = dir([folder '*.bmp']);%��ȡ�ļ����µ�����png��bmp�ļ�
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


%��С������haar��ͼ��XX����2��   
[c,l]=wavedec2(inputImage,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % �ع���2��ͼ��Ľ���ϵ��

nc=wthcoef2('h',c,l,n,p,threshType);     %�Ը�ƵС��ϵ��������ֵ����
  
% ͼ��Ķ�άС���ع�  
outputImage1=waverec2(nc,l,wname);    %ͼ��Ķ�άС���ع�
MSE_array(i,1) = count_MSE(double(inputImage),double(outputImage1));
PSNR_array(i,1) = count_PSNR(double(inputImage/255),double(outputImage1/255));


mc=wthcoef2('v',nc,l,n,p,threshType);    %�ٴζԸ�ƵС��ϵ��������ֵ����  
 
outputImage2=waverec2(mc,l,wname);   % ͼ��Ķ�άС���ع�    
MSE_array(i,2) = count_MSE(double(inputImage),double(outputImage2));
PSNR_array(i,2) = count_PSNR(double(inputImage/255),double(outputImage2/255));

%д���ļ����µĴ����png�ļ�
%     imwrite(outputImage,[claheqFolder 'picture_' num2str(i) '_cl_0.png'],'png');
    if i==length(files)
        subplot(211);
        imshow(mat2gray(inputImage));
        subplot(212);
        imshow(mat2gray(outputImage1));
    end
end





