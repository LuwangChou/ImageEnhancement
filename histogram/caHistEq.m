function [ outputImage ] = caHistEq( inputImage )
% ����cAֱ��ͼ���⻯
[row, col] = size(inputImage);
inputMax = uint8(max(inputImage));
% ͳ��ÿ������ֵ���ִ���
count = zeros(0, inputMax);
for i = 1 : row
    for j = 1 : col
        count(1, inputImage(i, j) + 1) = count(1, inputImage(i, j) + 1) + 1;
    end
end

f = zeros(1, inputMax);
f = double(f); count = double(count);

% ͳ��ÿ������ֵ���ֵĸ��ʣ� �õ�����ֱ��ͼ
for i = 1 : inputMax
    f(1, i) = count(1, i) / (row * col);
end

% ���ۼƸ��ʣ��õ��ۼ�ֱ��ͼ
for i = 2 : inputMax
    f(1, i) = f(1, i - 1) + f(1, i);
end

% ��f����ʵ������ֵ[0, 255]��ӳ�䡣 
for i = 1 : 256
    f(1, i) = f(1, i) * 255;
end

% ���ÿ�����ص��ӳ��
inputImage = double(inputImage);
for i = 1 : row
    for j = 1 : col
        inputImage(i, j) = f(1, inputImage(i, j) + 1);
    end
end

% ���ͼ�񣬲�ת��uint8���ݸ�ʽ
outputImage = uint8(inputImage);
end