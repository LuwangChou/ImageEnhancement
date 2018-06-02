%二维小波重构函数
function Y=mallatrec2(X,wname,level)

%输入:X      载入的小波系数矩阵;

%     level  小波分解次(级)数设定值(如果设定值超过最高可分解次数,按最高分解次数分解)

%      wname  小波名字wavelet name

%输出：Y     重构图像矩阵

 

[h,g]=wfilters(wname,'d');  %h,g分别为重构低通滤波器和重构高通滤波器

 

hz=size(X,2);

h1=hz/(2^(level-1));

while h1<=hz

    % 对列变换

    for col=1:h1

        temp=mrec1(X(1:h1,col)',h,g)';

        X(1:h1,col)=temp;

    end

    %再对行变换

    for row=1:h1

        temp=mrec1(X(row,1:h1),h,g);

         X(row,1:h1)=temp;

     end

     h1=h1*2;

    

end

Y=X;
  
%内部子函数，对一行小波系数进行重构

function y=mrec1(x,h,g)

%输入：x 行数组

%     h为低通滤波器

%     g为高通滤波器

%输出： y 进行一级小波重构后值

lenx=size(x,2);

 

 

r3=dyadup(x(1,1:lenx*0.5),0);   %内插零use para 0

r4=dyadup(x(1,(lenx*0.5+1):lenx),0);   %use para 0

y=ifft(fft(r3,lenx).*fft(h,lenx))+ ifft(fft(r4,lenx).*fft(g,lenx));   