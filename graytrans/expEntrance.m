%����ͼ����ǿ�㷨S=c*R^2 �˴�cȡ1 rȡ2
imageFV=imread('F:\fingervein_test.png');   %����ͼ��
c=1;
imageFV=mat2gray(imageFV);   %�����任��֧��uint8���͵����ݣ���һ�������һ��Ϊ�Ҷ�ͼ������ݸ�ʽ
rstFV=c*imageFV.*imageFV;

%��򷨣�����ֵ����ֵ��
level = graythresh(imageFV);
imageFV2=im2bw(imageFV,level);
level2 = graythresh(rstFV);
rstFV2=im2bw(imageFV,level2);

%��ʾͼ��
figure;
subplot(1,2,1);
imshow(imageFV);
title('ԭͼ��');
subplot(1,2,2);
imshow(rstFV);
title('�����任���ͼ��');
figure;
subplot(2,2,1);
imshow(imageFV2);
title('ԭͼ���ֵ��');
subplot(2,2,2);
imshow(rstFV2);
title('�������ֵ��');
subplot(2,2,3);
imhist(imageFV);
title('ԭͼ��Ҷȷֲ�');
subplot(2,2,4);
imhist(rstFV);
title('������Ҷȷֲ�');