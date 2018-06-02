function th=thresh_md(a);%该函数实现最大方差法计算分割阈值  
count=imhist(a); %返回图像矩阵各个灰度等级像素个数  
[m,n]=size(a);  
N=m*n-sum(sum(find(a==0),1));  
L=256;     %指定图像灰度等级  
count=count/N;%计算出各灰度出现的概率  
for i=2:L  
    if count(i)~=0  
        st=i-1;  
        break;  
    end  
end  %找出出现概率不是零的最小灰度  
for i=L:-1:1  
    if count(i)~=0;  
        nd=i-1;  
        break;  
    end   
end%找出出现概率不为零的最大灰度  
f=count(st+1:nd+1);  
p=st;q=nd-st;%分别表示为灰度起始和结束值  
u=0;  
for i=1:q;  
    u=u+f(i)*(p+i-1);  
    ua(i)=u;  
end%计算图像的平均灰度  
for i=1:q;  
    w(i)=sum(f(1:i));  
end%计算出选择不同K值时，A区域的概率  
d=(u*w-ua).^2./(w.*(1-w));%求出不同K值时类间的方差  
[y,tp]=max(d);%求出最大方差对应的灰度值  
th=tp+p;