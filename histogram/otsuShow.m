function  otsuShow( orgImg,rstImg)
%���otsu������ֵ����ֵ��
level = graythresh(orgImg);
orgImg2=im2bw(orgImg,level);
level2 = graythresh(rstImg);
rstImg2=im2bw(orgImg,level2);
figure;
subplot(2,2,1);
imshow(orgImg);
title('ԭʼͼ��');
subplot(2,2,2);
imshow(rstImg);
title('�任��ͼ��');
subplot(2,2,3);
imshow(orgImg2);
subplot(2,2,4);
imshow(rstImg2);
figure;
subplot(1,2,1);
imhist(orgImg);
title('ԭͼ��Ҷȷֲ�');
subplot(1,2,2);
imhist(rstImg);
title('�任��Ҷȷֲ�');
end

