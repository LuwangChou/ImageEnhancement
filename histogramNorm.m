clear all;
close all;
% 扩展原图像形成中间图像的高斯滤波
orgin=imread('F:\fingervein_test.png');
%orgin=rgb2gray(orgin);             %读入原图像
[m_o,n_o]=size(orgin);
orgin_hist=imhist(orgin)/(m_o*n_o);

standard = imread('F:\peppers.png');% 读入标准图
standard=rgb2gray(standard);  
[m_s,n_s]=size(standard);
standard_hist=imhist(standard)/(m_s*n_s);

startdard_value=[];                         % 标准图累积直方
orgin_value=[];                             % 原图像累积直方

for i=1:256
   startdard_value=[startdard_value sum(standard_hist(1:i))]; 
   orgin_value=[orgin_value sum(orgin_hist(1:i))];     
end


for i=1:256
    value{i}=startdard_value-orgin_value(i);
    value{i}=abs(value{i});
    [temp index(i)]=min(value{i});
end
newimg=zeros(m_o,n_o);
for i=1:m_o
    for j=1:n_o
        newimg(i,j)=index(orgin(i,j)+1)-1;
    end
end
newimg=uint8(newimg);

subplot(2,3,1);imshow(orgin);title('原图');
subplot(2,3,2);imshow(standard);title('标准图');
subplot(2,3,3);imshow(newimg);title('myself匹配到标准图');
subplot(2,3,4);imhist(orgin);
title('原图');
subplot(2,3,5);imhist(standard);
title('标准图');
subplot(2,3,6);imhist(newimg);
title('myself匹配到标准图');