function outputEntropy = count_Entropy(A)
% 计算Entropy 信息熵（量）entropy = - sum{k=0,2^n -1} pk*log2(pk)
A = double(A);
[row,col] = size(A);
grayMax=255;
rk=zeros(1,grayMax+1);
%计算灰度直方图
for k=1:grayMax+1
    for i=1:row
        for j=1:col
            if k == (A(i,j)+1)
                rk(1,k)=rk(1,k)+1;
            end
        end
    end
end
pk = 1/row/col * rk;
entropy = 0;
% 计算熵值
for k=1:grayMax
    if pk(1,k) > 0
    entropy = entropy - pk(1,k) * log2(pk(1,k));
    end
end

outputEntropy = entropy;


end

