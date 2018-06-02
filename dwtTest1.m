clear all;
close all;
clc;
img=double(imread('F:\ch4_images\cameraman.tif'));
[m n]=size(img);

[LL LH HL HH]=haar_dwt2D(img);  %当然dwt2(img,'haar')是一样的，我只是想明白细节
img=[LL LH;HL HH];      %一层分解

imgn=zeros(m,n);
for i=0:m/2:m/2
    for j=0:n/2:n/2
        [LL LH HL HH]=haar_dwt2D(img(i+1:i+m/2,j+1:j+n/2)); %对一层分解后的四个图像分别再分解
        imgn(i+1:i+m/2,j+1:j+n/2)=[LL LH;HL HH];  
    end
end

imshow(imgn)