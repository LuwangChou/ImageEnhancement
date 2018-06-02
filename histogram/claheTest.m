%CLAHE，Contrast Limited Adaptive Histogram Equalization
%自适应直方图均衡化
% imageFV=imread('F:\fingervein_test.png');   %读入图像
imageFV=imread('F:\fingervein_std.png');   %读入图像
%imageFV=rgb2gray(imread('F:\building.jpg'));   %读入图像
rstImg=adapthisteq(imageFV);
DDm=mse(imageFV,rstImg);
% map=[1 0 0;0 1 0;0 0 1];%三原色
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