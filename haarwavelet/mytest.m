%一维离散小波分解
% fx=[2,4,7,-1,-1,9,1,1];
% lpd=[1/2,1/2];
% hpd=[-1/2,1/2];
% dim=3;
% [cA,cD]=mydwt(fx,lpd,hpd,dim)  
% y=myidwt(cA,cD,lpd,hpd)

%二维小波分解与重构
% imageLena=imread('F:\Lena.jpg');
imageFV=imread('F:\fingervein_test.png');

% [cA,cV,cH,cD]=mydwt2(double(imageLena));
% [cA,cV,cH,cD]=mydwt2(double(imageFV));%自己写的mydwt2
[cA,cV,cH,cD]=dwt2(imageFV,'haar');
level = graythresh(imageFV)% 使用大津法，类间方差，自动确定阈值
rstFV = im2bw(imageFV,level);

% rdimg=myidwt2(cA,cV,cH,cD);%自己写的myidwt2

rdimg=uint8(idwt2(cA,cV,cH,cD,'haar'));
level2 = thresh_md(rdimg)/255% 使用大津法，类间方差，自动确定阈值
rstRD = im2bw(rdimg,level2);
figure;
imshow(imageFV);
figure;
imshow(mat2gray(rdimg));
figure;
imshow(rstFV);
figure;
imshow(rstRD);