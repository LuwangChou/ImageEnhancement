function [ LLnew ] = count_SVD( ca, caHq )
% 计算 SVD 奇异值计算
%输入ca 和 均衡化后的caHq,并返回改变后的ca 近似值

[U1,S1,V1] = svd(caHq);

[U2,S2,V2] = svd(ca);

beta = max(S1)/max(S2);

Snew =beta * S2;

LLnew=U2*Snew*V2';

end

