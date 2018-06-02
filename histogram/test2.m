clear all;

% inputImage = imread('F:\Lena.jpg');
% inputImage = imread('F:\fingervein_test.png');
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
% mode='db4';
% mode='haar';
mode='haar'
[ca,ch,cv,cd] = dwt2(inputImage,mode);
%[ca,ch,cv,cd] ��Ӧ [LL,HL,LH,HH]
%HE ֱ��ͼ���⻯
% inputImage2  = histeq(inputImage);%matlab �Դ���HE
inputImage2  = histogramEq(inputImage);%��дHE

cplt=0.01;
%CLAHE ���⻯
inputImage3  = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
[ca2,ch2,cv2,cd2] = dwt2(inputImage3,mode);
LLnew = count_SVD(ca,ca2);
% reconImage=0.9*inputImage;
% caHq = double( histeq(uint8(ca)) );
% ca = double(ca);
% LLnew = count_SVD(ca,caHq);


reconImage = idwt2(LLnew,ch,cv,cd,mode);
% ���������ǿPSNR
reconPSNR=count_PSNR(inputImage,reconImage);
%��Ȩƽ��
outputImage=weightedAverage(inputImage,reconImage,2,0.8);

% % ֱ��ͼ����PSNR
hEqPSNR=count_PSNR(inputImage,inputImage3);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
% ������� �˲���PSNR
% outputImage=filter2(fspecial('average',3),outputImage);

% filterPSNR=count_PSNR(inputImage,outputImage);





otsuShow(mat2gray(inputImage2),mat2gray(inputImage3));
otsuShow(mat2gray(reconImage),mat2gray(outputImage));


