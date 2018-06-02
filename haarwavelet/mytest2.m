%mytest2 
%测试二维图形 N 层离散小波分解Haar 
%使用wavedec2(X,N,'wname');
clc;
clear all;
% inputImage= imread('F:\Lena.jpg');
% inputImage = imread('F:\city.jpg');
inputImage = imread('F:\index_2.bmp');
inputImage = rgb2gray(inputImage);
inputImage = double(inputImage);
N = 1;
wname = 'db4';
[C,S] = wavedec2(inputImage,N,wname);
% [row,col] = size(C);
MapC = commonMapping(C,0.35,1.2);
% for i=1:row 
%     for j=1:col
%         if C(i,j)>300
%             C(i,j) = C(i,j)*0.9;
%         end
%         if C(i,j)<50
%             C(i,j) = C(i,j)*1.1;
%         end
%     end
% end
th = 0.5;
softC = wthresh(C,'s',th);
figure
% outputImage = waverec2(softC,S,wname);
outputImage = waverec2(MapC,S,wname);
subplot(1,2,1)
imshow(mat2gray(inputImage));
subplot(1,2,2);
imshow(mat2gray(outputImage));
figure
subplot(1,2,1)
imhist(mat2gray(inputImage));
subplot(1,2,2);
imhist(mat2gray(outputImage));