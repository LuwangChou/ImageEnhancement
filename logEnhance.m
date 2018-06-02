%对数图像增强算法S=c*log(r+1) 此处c取255/log(256)
imageFV=imread('F:\fingervein_test.png');   %读入图像
%c=255/log(256);
c=2.5;
imageFV=mat2gray(imageFV);   %对数变换不支持uint8类型的数据，将一个矩阵归一化为灰度图像的数据格式
rstFV=c*log(imageFV+1);
otsuShow(imageFV,rstFV);