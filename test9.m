clc;
clear all;
I = imread('F:\databaseThree\18.bmp');% 3 15 18
% [XMIN YMIN WIGTH HEIGHT] ���� 50 
[row,col]=size(I);
I2 = imcrop(I,[1 50 col 165]);
imwrite(I2,['F:\databaseThree\test\' '18.bmp'],'bmp');
figure, imshow(I)
axis on;grid on;
figure, imshow(I2)
axis on;grid on;

% % �������ݿ�3ͼ��
% % clc;
% % clear all;
% % folder = 'F:\databaseThree\';%���ݿ��廪
% % files = dir([folder '*.bmp']);%��ȡ�ļ����µ�����png��bmp�ļ�
% % 
% % for i=1:length(files)
% %     fileaddress = [folder files(i).name];
% %     inputImage=imread(fileaddress);
% %     [row,col]=size(inputImage);
% %     cropImage = imcrop(inputImage,[1 55 col 170]);
% %     imwrite(cropImage,[folder 'test\' num2str(i) '.bmp'],'bmp');
% %     
% % end
error_diff=[1,1;2,3]

decibels1 = 20*log10(1/(sqrt(mean(mean(error_diff.^2)))));
decibels2 = 20*log10(255/(sqrt(mean(mean(error_diff.^2)))));
delta = decibels1-decibels2;
beta = 20*log10(255);


