function gammaCorrection(image,gamma,a )
% name ����ͼ���ַ���ƣ�a ����������ȡ1�� gamma �Ƽ�Ϊ2.2 ����2.5
% gamma=2.2;
% a=1;
image=im2double(image);                
%image=rgb2gray(image);                % �������ǻҶ�ͼ��ʱ��ɾ���þ䣻
s = a * (image .^ gamma);
figure;
subplot (1 ,2 ,1), imshow(image), title('Original Image');
subplot (1 ,2 ,2), imshow(s), title(sprintf('Gamma: %0.1f',gamma));
end

