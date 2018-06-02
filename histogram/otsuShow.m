function  otsuShow( orgImg,rstImg)
%大津法otsu，求阈值，二值化
level = graythresh(orgImg);
orgImg2=im2bw(orgImg,level);
level2 = graythresh(rstImg);
rstImg2=im2bw(orgImg,level2);
figure;
subplot(2,2,1);
imshow(orgImg);
title('原始图像');
subplot(2,2,2);
imshow(rstImg);
title('变换后图像');
subplot(2,2,3);
imshow(orgImg2);
subplot(2,2,4);
imshow(rstImg2);
figure;
subplot(1,2,1);
imhist(orgImg);
title('原图像灰度分布');
subplot(1,2,2);
imhist(rstImg);
title('变换后灰度分布');
end

