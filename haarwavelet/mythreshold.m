function [ cAy,cVy,cHy,cDy ] = mythreshold(cA,cV,cH,cD,thd)
%��ֵ�����ڷֽ��cA,cV,cH,cD �Ͻ���ѡ��
lenA=length(cA);
lenV=length(cH);
lenH=length(cV);
lenD=length(cD);

% һ��ӳ�亯��
%Wout(i,j) = { Win(i,j) + G*(T1-1)  Win(i,j) > T1
% { G*Win(i,j)   -T1 < Win(i,j) < T1
% { Win(i,j) - G*(T1-1)  Win(i,j) > T1

MapcA = commonMapping(cA,0.4,2);


end

