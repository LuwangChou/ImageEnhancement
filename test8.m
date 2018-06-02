clear all; 
close all;
% image=imread('F:\fingervein_std.jpg');  %��ȡ�ؼ�֡
image=imread('F:\index_2.bmp');
image = rgb2gray(image);        %ת��Ϊ�Ҷ�ͼ


[high,width] = size(image);   % ���ͼ��ĸ߶ȺͿ��
F2 = double(image);        
U = double(image);       
uSobel = image;
for i = 2:high - 1   %sobel��Ե���
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
%������Ե�����ͼ��
otsuShow(image,uint8(uSobel));
BW3 = edge(image,'sobel', 0.09);


% ԭʼͼ�����Ե����ں�
addUO = double(image-uSobel)*1+double(uSobel);
otsuShow(image,uint8(addUO));




