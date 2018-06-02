function  outputImage  = highContrastRetention( inputImage,amount )
% High contrast retention
% �߷����  �߷���� = ԭʼͼ�� - ��˹ģ��ͼ�� + 127
% dst = r*(img - Blur(img))

% amount = 6 ;
amount=uint8(amount);  
  
% ���ø�˹�˲���  
Hsize = [5,5];
sigma=0.5;
G_Filter=fspecial('gaussian',Hsize,sigma);  
  
% ����˹�˲�  
inputImage_Filter = imfilter(inputImage, G_Filter,'conv');  
  
% ����ֵ  
inputImage_Diff=inputImage -  inputImage_Filter;  
  
%

outputImage=amount * inputImage_Diff + inputImage_Filter;  
figure;
imshow(outputImage);
end

