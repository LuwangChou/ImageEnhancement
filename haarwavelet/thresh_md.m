function th=thresh_md(a);%�ú���ʵ����󷽲����ָ���ֵ  
count=imhist(a); %����ͼ���������Ҷȵȼ����ظ���  
[m,n]=size(a);  
N=m*n-sum(sum(find(a==0),1));  
L=256;     %ָ��ͼ��Ҷȵȼ�  
count=count/N;%��������Ҷȳ��ֵĸ���  
for i=2:L  
    if count(i)~=0  
        st=i-1;  
        break;  
    end  
end  %�ҳ����ָ��ʲ��������С�Ҷ�  
for i=L:-1:1  
    if count(i)~=0;  
        nd=i-1;  
        break;  
    end   
end%�ҳ����ָ��ʲ�Ϊ������Ҷ�  
f=count(st+1:nd+1);  
p=st;q=nd-st;%�ֱ��ʾΪ�Ҷ���ʼ�ͽ���ֵ  
u=0;  
for i=1:q;  
    u=u+f(i)*(p+i-1);  
    ua(i)=u;  
end%����ͼ���ƽ���Ҷ�  
for i=1:q;  
    w(i)=sum(f(1:i));  
end%�����ѡ��ͬKֵʱ��A����ĸ���  
d=(u*w-ua).^2./(w.*(1-w));%�����ͬKֵʱ���ķ���  
[y,tp]=max(d);%�����󷽲��Ӧ�ĻҶ�ֵ  
th=tp+p;