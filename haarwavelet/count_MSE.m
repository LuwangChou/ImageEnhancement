function [ outputMSE ] = count_MSE(inputImage,outputImage )
% MSE = 1/MN * sum(0,N)sum(0,M) * (f - f')^2
temp = double(inputImage -  outputImage);
[row,col] = size(inputImage);
sumMSE = 0;
for i=1:row
    for j=1:col
        sumMSE = sumMSE + power(temp(i,j),2);
    end
end
outputMSE = sumMSE/(row*col);
end

