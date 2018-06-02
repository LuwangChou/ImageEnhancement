function [ outputImage ] = erDWT2( inputImage)
%��С������haar��ͼ��XX����2��
%����������Ӧ���⣬�����ؽ�ͼ��
%����С������������ֵ����
% % % % % ����
% % % clc;
% % % clear all;
% % % inputImage = imread('F:\3.bmp');
% % % inputImage = rgb2gray(inputImage);

wname='db3';
threshType='h';
% ���ó߶�����  
n=[1,2];        
% ������ֵ����           
p=[4,20];

[c,l]=wavedec2(inputImage,2,wname);   
a2 = wrcoef2('a',c,l,wname,2);  % �ع���2��ͼ��Ľ���ϵ��

cplt=0.01;
aHq  = adapthisteq(a2/255,'clipLimit',cplt,'Distribution','rayleigh');%����Ӧ����
% % % cla = adapthisteq(inputImage,'clipLimit',cplt,'Distribution','rayleigh');
% aHq =double( histogramEq(uint8(a2))); 
%SVD ����ֵ�ֽ�
% aHq2 = count_SVD(a2,aHq*255);

% ��ֵ����
nc=wthcoef2('h',c,l,n,p,threshType);     %�Ը�ƵС��ϵ��������ֵ����
mc=wthcoef2('v',nc,l,n,p,threshType);    %�ٴζԸ�ƵС��ϵ��������ֵ���� 

%�ָ�a ���ƾ��� h v d
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
%�ı�a2
% a3 = a2*0.9;

reconImage = mat2gray( h1+v1+d1+h2+v2+d2 + aHq*255);
% reconImage = mat2gray(h1+v1+d1+ aHq2);
outputImage = reconImage;
% % % otsuShow(mat2gray(inputImage),reconImage);
% % % otsuShow(mat2gray(inputImage),mat2gray(cla));
end

