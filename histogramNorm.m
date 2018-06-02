clear all;
close all;
% ��չԭͼ���γ��м�ͼ��ĸ�˹�˲�
orgin=imread('F:\fingervein_test.png');
%orgin=rgb2gray(orgin);             %����ԭͼ��
[m_o,n_o]=size(orgin);
orgin_hist=imhist(orgin)/(m_o*n_o);

standard = imread('F:\peppers.png');% �����׼ͼ
standard=rgb2gray(standard);  
[m_s,n_s]=size(standard);
standard_hist=imhist(standard)/(m_s*n_s);

startdard_value=[];                         % ��׼ͼ�ۻ�ֱ��
orgin_value=[];                             % ԭͼ���ۻ�ֱ��

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

subplot(2,3,1);imshow(orgin);title('ԭͼ');
subplot(2,3,2);imshow(standard);title('��׼ͼ');
subplot(2,3,3);imshow(newimg);title('myselfƥ�䵽��׼ͼ');
subplot(2,3,4);imhist(orgin);
title('ԭͼ');
subplot(2,3,5);imhist(standard);
title('��׼ͼ');
subplot(2,3,6);imhist(newimg);
title('myselfƥ�䵽��׼ͼ');