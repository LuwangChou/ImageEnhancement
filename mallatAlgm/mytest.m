%���Ժ�������������
clc;clear;

% X=imread('F:\Lena.jpg');%·��
X=imread('F:\fingervein_test.jpg');%·��
 X=double(X);

A = mallatdec2(X,'sym2',2);


image(abs(A));

colormap(gray(255));

title('��߶ȷֽ�ͼ��');

% Y= mallatrec2(A,'sym2',2);
Y=X;
Y=real(Y);

figure(2);

subplot(1,2,1);

image(X);

colormap(gray(255));

title('ԭʼͼ��');

subplot(1,2,2);

image(Y);

colormap(gray(255));

title('�ع�ͼ��');

csize=size(X);

sr=csize(1);

sc=csize(2);

mse=sum(sum( (Y-X).^2,1))/(sr*sc);

psnr=10*log(255*255/mse)/log(10);