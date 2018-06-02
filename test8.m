clear all; 
close all;
% image=imread('F:\fingervein_std.jpg');  %读取关键帧
image=imread('F:\index_2.bmp');
image = rgb2gray(image);        %转化为灰度图


[high,width] = size(image);   % 获得图像的高度和宽度
F2 = double(image);        
U = double(image);       
uSobel = image;
for i = 2:high - 1   %sobel边缘检测
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
%画出边缘检测后的图像
otsuShow(image,uint8(uSobel));
BW3 = edge(image,'sobel', 0.09);


% 原始图像与边缘检测融合
addUO = double(image-uSobel)*1+double(uSobel);
otsuShow(image,uint8(addUO));




