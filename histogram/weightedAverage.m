function [ outputImage ] = weightedAverage( inputImage,reconImage,alpha,beta )
%weightedAverage 原始图像和重建图像加权平均
%IE = I0 .* H + beta * IR .* (MatrixOne -H)     beta 取值范围为[1,2]经验值
%MatrixOne是全部取值1的矩阵
%H(i,j) = f(I0(i,j)) .^ alpha   I0(i,j)输入图像的像素点(i,j)的灰度值
% f(I0(i,j))  = (I0(i,j) - I0min)/(I0max-I0min)
% beta=1.3;
% alpha = 1.5;
[row,col]=size(inputImage);
H=zeros(row,col);
MatrixOne = ones(row,col);
for i=1:row
    for j=1:col
        retnFx = fx(inputImage(i,j));
%         H(i,j) =  power(retnFx,alpha);
        H(i,j) = double(retnFx) .^ alpha;
    end
end
outputImage = double(inputImage) .* H + beta * double(reconImage) .* (MatrixOne -H);
end

