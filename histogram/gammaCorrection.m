function gammaCorrection(image,gamma,a )
% name 输入图像地址名称，a 代表常数，常取1， gamma 推荐为2.2 或者2.5
% gamma=2.2;
% a=1;
image=im2double(image);                
%image=rgb2gray(image);                % 当输入是灰度图像时，删除该句；
s = a * (image .^ gamma);
figure;
subplot (1 ,2 ,1), imshow(image), title('Original Image');
subplot (1 ,2 ,2), imshow(s), title(sprintf('Gamma: %0.1f',gamma));
end

