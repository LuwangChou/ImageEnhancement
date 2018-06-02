%把 近似向量改变后再插入到原来矩阵上
% c 储存的是 a近似矩阵l(1,1)*l(1,2) 行和列， 列向量的转置的组合
clc;
clear all;
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
wname='haar';
[c,l]=wavedec2(inputImage,2,wname);
%恢复a 近似矩阵
s = 1;
a1 = wrcoef2('a',c,l,wname,s); 
h1 = wrcoef2('h',c,l,wname,s); 
v1 = wrcoef2('v',c,l,wname,s); 
d1 = wrcoef2('d',c,l,wname,s); 
s = 2;
a2 = wrcoef2('a',c,l,wname,s); 
h2 = wrcoef2('h',c,l,wname,s); 
v2 = wrcoef2('v',c,l,wname,s); 
d2 = wrcoef2('d',c,l,wname,s); 
%改变a2
% a3 = a2*0.9;

reconImage = mat2gray(a1+h1+v1+d1+a2+h2+v2+d2);

% otsuShow(inputImage,reconImage);%测试图像



