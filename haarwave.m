%haarС����ϰ
clear all;
close all;
clc;
orgimg=imread('F:\ch4_images\cameraman.tif');
img=double(orgimg);

[m n]=size(img);

[LL LH HL HH]=dwt2(img,'haar');  %��Ȼdwt2(img,'haar')��һ���ģ���ֻ��������ϸ��
figure;
imshow(orgimg);
figure;
imshow(LL);
%plot(LL,'r*');
