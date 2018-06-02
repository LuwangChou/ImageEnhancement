function  outputImage  = highContrastRetention( inputImage,amount )
% High contrast retention
% 高反差保留  高反差保留 = 原始图像 - 高斯模糊图像 + 127
% dst = r*(img - Blur(img))

% amount = 6 ;
amount=uint8(amount);  
  
% 设置高斯滤波器  
Hsize = [5,5];
sigma=0.5;
G_Filter=fspecial('gaussian',Hsize,sigma);  
  
% 做高斯滤波  
inputImage_Filter = imfilter(inputImage, G_Filter,'conv');  
  
% 做差值  
inputImage_Diff=inputImage -  inputImage_Filter;  
  
%

outputImage=amount * inputImage_Diff + inputImage_Filter;  
figure;
imshow(outputImage);
end

