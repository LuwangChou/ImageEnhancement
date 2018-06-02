clear all;
%测试高反差保留
inputImage = imread('F:\Lena.jpg');
% inputImage = imread('F:\fingervein_test.png');
% inputImage = imread('eyeball_test.png');
% inputImage = rgb2gray(inputImage);
% outputImage = highContrastRetention(inputImage,1);
% outputImage = highContrastRetention(inputImage,3);
% outputImage = highContrastRetention(inputImage,6);
% outputImage = highContrastRetention(inputImage,50);
% 结果 6 效果好一些

% outputImage = highContrastRetention(inputImage,[1,1]);
% outputImage = highContrastRetention(inputImage,[3,3]);
% outputImage = highContrastRetention(inputImage,[6,6]);
% outputImage = highContrastRetention(inputImage,[50,50]);

% outputImage = highContrastRetention(inputImage,1);
% otsuShow(mat2gray(inputImage),mat2gray(outputImage));

% outputImage = highContrastRetention(inputImage,3);
% otsuShow(mat2gray(inputImage),mat2gray(outputImage));
% 
% outputImage = highContrastRetention(inputImage,6);
% otsuShow(mat2gray(inputImage),mat2gray(outputImage));