%mytest1
%测试二维图形一层离散小波分解Haar 
%使用dwt2(X,N,'wname');
clc;
clear all;
inputImage = double(imread('F:\Lena.jpg'));
[cA,cH,cV,cD] = mydwt2(inputImage);
[row,col] = size(cA);

for i=1:row 
    for j=1:col
        if cA(i,j)>300
            cA(i,j) = cA(i,j)*0.5;
        end
        if cA(i,j)<50
            cA(i,j) = cA(i,j)*2;
        end
    end
end

outputImage = myidwt2(cA,cH,cV,cD);
subplot(1,2,1)
imshow(mat2gray(inputImage));
subplot(1,2,2);
imshow(mat2gray(outputImage));