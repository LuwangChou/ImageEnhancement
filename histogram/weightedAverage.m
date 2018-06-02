function [ outputImage ] = weightedAverage( inputImage,reconImage,alpha,beta )
%weightedAverage ԭʼͼ����ؽ�ͼ���Ȩƽ��
%IE = I0 .* H + beta * IR .* (MatrixOne -H)     beta ȡֵ��ΧΪ[1,2]����ֵ
%MatrixOne��ȫ��ȡֵ1�ľ���
%H(i,j) = f(I0(i,j)) .^ alpha   I0(i,j)����ͼ������ص�(i,j)�ĻҶ�ֵ
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

