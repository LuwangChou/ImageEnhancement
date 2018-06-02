function [ outputLEI ] = count_LEI( A,B )
%LEI local entropy increment (LEI) 熵增量
% 分块计算熵值
% 公式为LEI = 1/hSplit/vSplit  sum(l=1,hSplit,k=1,vSplit)
% 20*ln(entropyE/entropy0)
% 下面是测试
% clc;
% clear all;
% A = imread('F:\Lena.jpg');
% B = 0.8*A;
%分割hSplit 水平分割，vSplit 垂直分割
hSplit=8;
vSplit=8; 


[row,col] = size(A);
hR = repmat(round(row/hSplit),1,hSplit-1);
hR = [hR,row-round(row/hSplit)*(hSplit-1)];
vC = repmat(round(col/vSplit),1,vSplit-1);
vC = [vC,col-round(col/vSplit)*(vSplit-1)];

AS = mat2cell(A,hR,vC);
BS = mat2cell(B,hR,vC);

%计算LEI
leiEn = 0;
for l=1:hSplit
    for k=1:vSplit
    tempA = cell2mat(AS(1,k));
    tempB = cell2mat(BS(1,k));
    aEn = count_Entropy(tempA);
    bEn = count_Entropy(tempB);
    leiEn = leiEn + 20*log(aEn/bEn);
    end    
end
outputLEI = leiEn /hSplit/vSplit;

end