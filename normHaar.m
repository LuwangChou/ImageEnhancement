%ʹ�ù淶����С���任�㷨����Matlab  �Ĺ���HaarС���任
%����f(x) = [2,5,8,9,7,4,-1,-1] 
fx=[2,5,8,9,7,4,-1,-1];
gx=zeros(1,length(fx));
h=length(fx);
while h>1
    h=h/2;
    for i=0:h-1
%         gx(i)=(fx(2*i)+fx(2*i+1))/sqrt(2);
%         gx(h+i)=(fx(2*i)-fx(2*i+1))/sqrt(2);
%           ����Ĵ���=�ұ߲��Ǵӵ�һ�ʼ�ġ�
        gx(i+1)=(fx(2*i+1)+fx(2*i+2))/sqrt(2);
        gx(h+i+1)=(fx(2*i+1)-fx(2*i+2))/sqrt(2);
    end
    fx=gx
end
%���
