%�� ���������ı���ٲ��뵽ԭ��������
% c ������� a���ƾ���l(1,1)*l(1,2) �к��У� ��������ת�õ����
clc;
clear all;
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
wname='haar';
[c,l]=wavedec2(inputImage,2,wname);
%�ָ�a ���ƾ���
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
%�ı�a2
% a3 = a2*0.9;

reconImage = mat2gray(a1+h1+v1+d1+a2+h2+v2+d2);

% otsuShow(inputImage,reconImage);%����ͼ��



