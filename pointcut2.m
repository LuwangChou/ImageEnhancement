[Y,Fs,bits] = wavread('E:/FFOutput/one.wav');%����ֵ�ֱ�ΪY��ȡƬ�Σ�Fs������Ĭ��Ϊ44100��bits����λ��һ��Ϊ16λ
%Y_cut1=Y(((Fs*5+1):Fs*15),:);
len=length(Y)/Fs/10;
%��һ�׸��г�10sһ��Ƭ��q����Ϊֹ
for i=0:len-1
Y_cut1=Y(((Fs*i+1):Fs*(i+10)),:);
wavwrite(Y_cut1,Fs,bits,['E:/FFOutput/' 'newname' num2str(i) '.wav']);
end
sound(Y_cut1,Fs);