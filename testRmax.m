% �����ֽ�� CA��Ƶ������ֵȥ�룬CH,CV,��Ƶ��ֵ������CD��ƵӲ��ֵȥ��

clc;
clear all;
inputImage = imread('F:\picture_3.png');
% inputImage = imread('F:\3.bmp');
% inputImage = rgb2gray(inputImage);
%����С������������ֵ����
wname='haar';
threshType='h';
% ���ó߶�����  
n=[1,2];        
% ������ֵ����           
p=[4,4];
T1=0.2;
T2=0.2;

%��С������haar��ͼ��XX����2��ֽ�   
[c,l]=wavedec2(inputImage,1,wname);   
a1 = wrcoef2('a',c,l,wname,1);  % �ع���1��ͼ��Ľ���ϵ��
% as1 = wthresh(a1,'s',T1);%������ֵ����



d1 = wrcoef2('d',c,l,wname,1);  % �ع���1��ͼ��ĸ�Ƶϵ��
dh1 = wthresh(d1,'h',T2);%������ֵ����

v1= wrcoef2('v',c,l,wname,1);
h1= wrcoef2('h',c,l,wname,1);
BWv = imregionalmax(v1);
BWh = imregionalmax(h1);
vm1 = double(BWv).*v1;
hm1 = double(BWh).*h1;

% ͼ��Ķ�άС���ع�  
otsuShow(mat2gray(a1),mat2gray(as1));
% otsuShow(mat2gray(h1),mat2gray(d1));
outputImage = as1 + vm1 + hm1 + dh1;
% otsuShow(inputImage,mat2gray(outputImage));
MSE_1 = count_MSE(double(inputImage),double(outputImage));
PSNR_1 = count_PSNR(double(inputImage/255),double(outputImage/255));

