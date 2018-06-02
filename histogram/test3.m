clear all;
%测试滤波效果，使用滤波器有均值滤波器
%K1=filter2(fspecial('average',3),J)
% inputImage = imread('F:\fingervein_test.png');
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
[ca,ch,cv,cd] = dwt2(inputImage,'db4');
%[ca,ch,cv,cd] 对应 [LL,HL,LH,HH]
inputImage2  = histeq(inputImage);
cplt=0.01;
inputImage3  = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
[ca2,ch2,cv2,cd2] = dwt2(inputImage3,'db4');
LLnew = count_SVD(ca,ca2);
reconImage = idwt2(LLnew,ch,cv,cd,'db4');

% 直方图均衡PSNR
hEqPSNR=count_PSNR(inputImage,inputImage2);
claheEqPSNR=count_PSNR(inputImage,inputImage2);


%加权平均
% outputImage = imadjust(inputImage,[],[],0.9);
outputImage = weightedAverage(inputImage,reconImage,1.5,0.9);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);



%滤波器
outputImage=filter2(fspecial('average',1),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
% 提出方法增强PSNR
outputImage=filter2(fspecial('average',3),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',5),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',7),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',9),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',11),outputImage);


%滤波器
outputImage=filter2(fspecial('gaussian'),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('laplacian'),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('log'),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('prewitt'),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('sobel'),outputImage);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('unsharp'),outputImage);

%对加噪图像进行二维自适应维纳滤波
outputImage=wiener2(outputImage,[3,3]);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
%对加噪图像进行二维自适应维纳滤波
outputImage=wiener2(outputImage,[5,5]);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
%对加噪图像进行二维自适应维纳滤波
outputImage=wiener2(outputImage,[7,7]);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);
%对加噪图像进行二维自适应维纳滤波
outputImage=wiener2(outputImage,[9,9]);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);

% Use wpdencmp for image de-noising. 
% Find default values (see ddencmp).
[thr,sorh,keepapp,crit] = ddencmp('den','wp',outputImage)

% De-noise image using global thresholding with 
% SURE best basis. 
outputImage = wpdencmp(outputImage,sorh,3,'sym4',crit,thr,keepapp);
% 提出方法增强PSNR
newPSNR=count_PSNR(inputImage,outputImage);



