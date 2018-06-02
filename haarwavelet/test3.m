clc;
clear all;
%²âÊÔ ¼ÆËã±ê×¼²î
inputImage = imread('F:\index_2.bmp');
inputImage = double(rgb2gray(inputImage));
outputImage = double(uint8(1/(0.65-0.05) * inputImage));
% matA =[1,2;1,2];
stdA = count_StdDev(inputImage);
stdB = count_StdDev(outputImage);
% count_PSNR(inputImage,inputImage);
% count_PSNR(inputImage,outputImage);

subplot(1,2,1)
imshow(mat2gray(inputImage));
subplot(1,2,2);
imshow(mat2gray(outputImage));
figure
subplot(2,1,1)
imhist(mat2gray(inputImage));
subplot(2,1,2);
imhist(mat2gray(outputImage));


