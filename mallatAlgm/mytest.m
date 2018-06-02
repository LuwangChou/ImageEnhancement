%测试函数（主函数）
clc;clear;

% X=imread('F:\Lena.jpg');%路径
X=imread('F:\fingervein_test.jpg');%路径
 X=double(X);

A = mallatdec2(X,'sym2',2);


image(abs(A));

colormap(gray(255));

title('多尺度分解图像');

% Y= mallatrec2(A,'sym2',2);
Y=X;
Y=real(Y);

figure(2);

subplot(1,2,1);

image(X);

colormap(gray(255));

title('原始图像');

subplot(1,2,2);

image(Y);

colormap(gray(255));

title('重构图像');

csize=size(X);

sr=csize(1);

sc=csize(2);

mse=sum(sum( (Y-X).^2,1))/(sr*sc);

psnr=10*log(255*255/mse)/log(10);