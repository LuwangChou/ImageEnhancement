

I=imread('F:\fingervein_std.png');%读入图像

subplot(1,2,1);

imshow(I);

title('原图像');
%图像取反函数
J=imcomplement(I);

subplot(1,2,2);

imshow(J);

title('取反后的图像');