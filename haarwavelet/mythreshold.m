function [ cAy,cVy,cHy,cDy ] = mythreshold(cA,cV,cH,cD,thd)
%阈值法，在分解的cA,cV,cH,cD 上进行选择
lenA=length(cA);
lenV=length(cH);
lenH=length(cV);
lenD=length(cD);

% 一般映射函数
%Wout(i,j) = { Win(i,j) + G*(T1-1)  Win(i,j) > T1
% { G*Win(i,j)   -T1 < Win(i,j) < T1
% { Win(i,j) - G*(T1-1)  Win(i,j) > T1

MapcA = commonMapping(cA,0.4,2);


end

