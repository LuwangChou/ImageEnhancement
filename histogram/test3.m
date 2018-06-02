clear all;
%�����˲�Ч����ʹ���˲����о�ֵ�˲���
%K1=filter2(fspecial('average',3),J)
% inputImage = imread('F:\fingervein_test.png');
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
[ca,ch,cv,cd] = dwt2(inputImage,'db4');
%[ca,ch,cv,cd] ��Ӧ [LL,HL,LH,HH]
inputImage2  = histeq(inputImage);
cplt=0.01;
inputImage3  = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
[ca2,ch2,cv2,cd2] = dwt2(inputImage3,'db4');
LLnew = count_SVD(ca,ca2);
reconImage = idwt2(LLnew,ch,cv,cd,'db4');

% ֱ��ͼ����PSNR
hEqPSNR=count_PSNR(inputImage,inputImage2);
claheEqPSNR=count_PSNR(inputImage,inputImage2);


%��Ȩƽ��
% outputImage = imadjust(inputImage,[],[],0.9);
outputImage = weightedAverage(inputImage,reconImage,1.5,0.9);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);



%�˲���
outputImage=filter2(fspecial('average',1),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
% ���������ǿPSNR
outputImage=filter2(fspecial('average',3),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',5),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',7),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',9),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('average',11),outputImage);


%�˲���
outputImage=filter2(fspecial('gaussian'),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('laplacian'),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('log'),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('prewitt'),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('sobel'),outputImage);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
outputImage=filter2(fspecial('unsharp'),outputImage);

%�Լ���ͼ����ж�ά����Ӧά���˲�
outputImage=wiener2(outputImage,[3,3]);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
%�Լ���ͼ����ж�ά����Ӧά���˲�
outputImage=wiener2(outputImage,[5,5]);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
%�Լ���ͼ����ж�ά����Ӧά���˲�
outputImage=wiener2(outputImage,[7,7]);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);
%�Լ���ͼ����ж�ά����Ӧά���˲�
outputImage=wiener2(outputImage,[9,9]);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);

% Use wpdencmp for image de-noising. 
% Find default values (see ddencmp).
[thr,sorh,keepapp,crit] = ddencmp('den','wp',outputImage)

% De-noise image using global thresholding with 
% SURE best basis. 
outputImage = wpdencmp(outputImage,sorh,3,'sym4',crit,thr,keepapp);
% ���������ǿPSNR
newPSNR=count_PSNR(inputImage,outputImage);



