addpath('F:\');
im= imread('pictureone.jpg');
kern=[0 -1 0;-1 5 -1;0 -1 0];
result=cv.filter2D(im,kern);
subplot(1,2,1);imshow(im);title('ԭʼͼ��');
subplot(1,2,2);imshow(result);title('���ͼ��');