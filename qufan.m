

I=imread('F:\fingervein_std.png');%����ͼ��

subplot(1,2,1);

imshow(I);

title('ԭͼ��');
%ͼ��ȡ������
J=imcomplement(I);

subplot(1,2,2);

imshow(J);

title('ȡ�����ͼ��');