%haar小波练习
clear all;
close all;
clc;
orgimg=imread('F:\ch4_images\cameraman.tif');
img=double(orgimg);

[m n]=size(img);

[LL LH HL HH]=dwt2(img,'haar');  %当然dwt2(img,'haar')是一样的，我只是想明白细节
figure;
imshow(orgimg);
figure;
imshow(LL);
%plot(LL,'r*');
