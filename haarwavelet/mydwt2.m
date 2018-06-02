function [cA,cV,cH,cD]=mydwt2(x)
% 函数 MYDWT2() 对输入的row*col维矩阵 x 进行二维小波分解，输出四个分解系数子矩阵[cA,cV,cH,cD]
% 输入参数：x —— 输入矩阵，为r*c维矩阵。
% 输出参数：cA,cV,cH,cD —— 是分解系数矩阵的四个相等大小的子矩阵,大小均为 r/2 * c/2 维
%               cA：低频部分分解系数；    cV：垂直方向分解系数；
%               cH：水平方向分解系数；    cD：对角线方向分解系数。

lpd=[1/2 1/2];hpd=[-1/2 1/2];           % 默认的低通、高通滤波器
[row,col]=size(x);                      % 读取输入矩阵的大小
for j=1:row                             % 首先对输入矩阵的每一行序列进行一维离散小波分解
    tmp1=x(j,:);
    [ca1,cd1]=mydwt(tmp1,lpd,hpd,1);
    x(j,:)=[ca1,cd1];                   % 将分解系数序列再存入矩阵x中，得到[L|H]
end
for k=1:col                             % 再对输入矩阵的每一列序列进行一维离散小波分解
    tmp2=x(:,k);        %理解，不为输入矩阵，应为缓存矩阵
    [ca2,cd2]=mydwt(tmp2,lpd,hpd,1);
    x(:,k)=[ca2,cd2];                   % 将分解所得系数存入矩阵x中，得到[cA,cV;cH,cD]
end

cA=x(1:row/2,1:col/2);                  % cA是矩阵x的左上角部分
cH=x(row/2+1:row,1:col/2);              % cH是矩阵x的左下角部分
cV=x(1:row/2,col/2+1:col);              % cV是矩阵x的右上角部分
cD=x(row/2+1:row,col/2+1:col);          % cD是矩阵x的右下角部分
