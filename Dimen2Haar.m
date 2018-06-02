%二维小波变换Haar
%标准分解
img = imread('F:\peppers.png');
img = rgb2gray(img);
% [row,col]=size(img);
% for i=1:row
%     Decomposition(img(i,:),col);
% end
% for j=1:col
%     Decomposition(img(:,j),row);
% end
[CA,CH,CV,CD] = dwt2(img,'haar');
rstImg=idwt2(CA,CH,CV,CD,'haar');
figure;
imshow(img);
figure;
imshow(mat2gray(rstImg));


