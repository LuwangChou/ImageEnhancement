%对数图像增强算法S=c*R^2 此处c取1 r取2
imageFV=imread('F:\fingervein_test.png');   %读入图像
c=1;
imageFV=mat2gray(imageFV);   %对数变换不支持uint8类型的数据，将一个矩阵归一化为灰度图像的数据格式
rstFV=c*imageFV.*imageFV;

%大津法，求阈值，二值化
level = graythresh(imageFV);
imageFV2=im2bw(imageFV,level);
level2 = graythresh(rstFV);
rstFV2=im2bw(imageFV,level2);

%显示图像
figure;
subplot(1,2,1);
imshow(imageFV);
title('原图像');
subplot(1,2,2);
imshow(rstFV);
title('对数变换后的图像');
figure;
subplot(2,2,1);
imshow(imageFV2);
title('原图像二值化');
subplot(2,2,2);
imshow(rstFV2);
title('对数后二值化');
subplot(2,2,3);
imhist(imageFV);
title('原图像灰度分布');
subplot(2,2,4);
imhist(rstFV);
title('对数后灰度分布');