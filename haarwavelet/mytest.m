%һά��ɢС���ֽ�
% fx=[2,4,7,-1,-1,9,1,1];
% lpd=[1/2,1/2];
% hpd=[-1/2,1/2];
% dim=3;
% [cA,cD]=mydwt(fx,lpd,hpd,dim)  
% y=myidwt(cA,cD,lpd,hpd)

%��άС���ֽ����ع�
% imageLena=imread('F:\Lena.jpg');
imageFV=imread('F:\fingervein_test.png');

% [cA,cV,cH,cD]=mydwt2(double(imageLena));
% [cA,cV,cH,cD]=mydwt2(double(imageFV));%�Լ�д��mydwt2
[cA,cV,cH,cD]=dwt2(imageFV,'haar');
level = graythresh(imageFV)% ʹ�ô�򷨣���䷽��Զ�ȷ����ֵ
rstFV = im2bw(imageFV,level);

% rdimg=myidwt2(cA,cV,cH,cD);%�Լ�д��myidwt2

rdimg=uint8(idwt2(cA,cV,cH,cD,'haar'));
level2 = thresh_md(rdimg)/255% ʹ�ô�򷨣���䷽��Զ�ȷ����ֵ
rstRD = im2bw(rdimg,level2);
figure;
imshow(imageFV);
figure;
imshow(mat2gray(rdimg));
figure;
imshow(rstFV);
figure;
imshow(rstRD);