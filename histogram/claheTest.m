%CLAHE��Contrast Limited Adaptive Histogram Equalization
%����Ӧֱ��ͼ���⻯
% imageFV=imread('F:\fingervein_test.png');   %����ͼ��
imageFV=imread('F:\fingervein_std.png');   %����ͼ��
%imageFV=rgb2gray(imread('F:\building.jpg'));   %����ͼ��
rstImg=adapthisteq(imageFV);
DDm=mse(imageFV,rstImg);
% map=[1 0 0;0 1 0;0 0 1];%��ԭɫ
DDpr=count_PSNR(mat2gray(imageFV),mat2gray(rstImg));

DDepyFV =entropy(imageFV);
DDepyRST=entropy(rstImg);
figure;
subplot(1,2,1);
imshow(imageFV);
subplot(1,2,2);
imshow(rstImg);
figure;
subplot(1,2,1);
imhist(imageFV);
subplot(1,2,2);
imhist(rstImg);