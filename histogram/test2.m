clear all;

% inputImage = imread('F:\Lena.jpg');
% inputImage = imread('F:\fingervein_test.png');
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
% mode='db4';
% mode='haar';
mode='haar'
[ca,ch,cv,cd] = dwt2(inputImage,mode);
%[ca,ch,cv,cd] 对应 [LL,HL,LH,HH]
%HE 直方图均衡化
% inputImage2  = histeq(inputImage);%matlab 自带的HE
inputImage2  = histogramEq(inputImage);%复写HE

cplt=0.01;
%CLAHE 均衡化
inputImage3  = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
[ca2,ch2,cv2,cd2] = dwt2(inputImage3,mode);
LLnew = count_SVD(ca,ca2);
% reconImage=0.9*inputImage;
% caHq = double( histeq(uint8(ca)) );
% ca = double(ca);
% LLnew = count_SVD(ca,caHq);


reconImage = idwt2(LLnew,ch,cv,cd,mode);
% 提出方法增强PSNR
reconPSNR=count_PSNR(inputImage,reconImage);
%加权平均
outputImage=weightedAverage(inputImage,reconImage,2,0.8);

% % 直方图均衡PSNR
hEqPSNR=count_PSNR(inputImage,inputImage3);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
% 提出方法 滤波后PSNR
% outputImage=filter2(fspecial('average',3),outputImage);

% filterPSNR=count_PSNR(inputImage,outputImage);





otsuShow(mat2gray(inputImage2),mat2gray(inputImage3));
otsuShow(mat2gray(reconImage),mat2gray(outputImage));


