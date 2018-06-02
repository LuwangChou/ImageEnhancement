function [ outputImage ] = caHistEq( inputImage )
% 计算cA直方图均衡化
[row, col] = size(inputImage);
inputMax = uint8(max(inputImage));
% 统计每个像素值出现次数
count = zeros(0, inputMax);
for i = 1 : row
    for j = 1 : col
        count(1, inputImage(i, j) + 1) = count(1, inputImage(i, j) + 1) + 1;
    end
end

f = zeros(1, inputMax);
f = double(f); count = double(count);

% 统计每个像素值出现的概率， 得到概率直方图
for i = 1 : inputMax
    f(1, i) = count(1, i) / (row * col);
end

% 求累计概率，得到累计直方图
for i = 2 : inputMax
    f(1, i) = f(1, i - 1) + f(1, i);
end

% 用f数组实现像素值[0, 255]的映射。 
for i = 1 : 256
    f(1, i) = f(1, i) * 255;
end

% 完成每个像素点的映射
inputImage = double(inputImage);
for i = 1 : row
    for j = 1 : col
        inputImage(i, j) = f(1, inputImage(i, j) + 1);
    end
end

% 输出图像，并转化uint8数据格式
outputImage = uint8(inputImage);
end