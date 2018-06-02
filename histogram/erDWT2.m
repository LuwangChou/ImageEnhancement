function [ outputImage ] = erDWT2( inputImage)
%用小波函数haar对图像XX进行2层
%并进行自适应均衡，返回重建图像
%设置小波基函数和阈值类型
% % % % % 测试
% % % clc;
% % % clear all;
% % % inputImage = imread('F:\3.bmp');
% % % inputImage = rgb2gray(inputImage);

wname='db3';
threshType='h';
% 设置尺度向量  
n=[1,2];        
% 设置阈值向量           
p=[4,20];

[c,l]=wavedec2(inputImage,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % 重构第2层图像的近似系数

cplt=0.01;
aHq  = adapthisteq(a2/255,'clipLimit',cplt,'Distribution','rayleigh');%自适应均衡
% % % cla = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
% aHq =double( histogramEq(uint8(a2))); 
%SVD 奇异值分解
% aHq2 = count_SVD(a2,aHq*255);

% 阈值处理
nc=wthcoef2('h',c,l,n,p,threshType);     %对高频小波系数进行阈值处理
mc=wthcoef2('v',nc,l,n,p,threshType);    %再次对高频小波系数进行阈值处理 

%恢复a 近似矩阵 h v d
s = 1;
% a1 = wrcoef2('a',nc,l,wname,s); 
h1 = wrcoef2('h',nc,l,wname,s); 
v1 = wrcoef2('v',nc,l,wname,s); 
d1 = wrcoef2('d',nc,l,wname,s); 
s = 2;
% a2 = wrcoef2('a',c,l,wname,s); 
h2 = wrcoef2('h',nc,l,wname,s); 
v2 = wrcoef2('v',nc,l,wname,s); 
d2 = wrcoef2('d',nc,l,wname,s); 
%改变a2
% a3 = a2*0.9;

reconImage = mat2gray( h1+v1+d1+h2+v2+d2 + aHq*255);
% reconImage = mat2gray(h1+v1+d1+ aHq2);
outputImage = reconImage;
% % % otsuShow(mat2gray(inputImage),reconImage);
% % % otsuShow(mat2gray(inputImage),mat2gray(cla));
end

