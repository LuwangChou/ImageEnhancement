[Y,Fs,bits] = wavread('E:/FFOutput/one.wav');%返回值分别为Y读取片段，Fs采样率默认为44100，bits编码位数一般为16位
%Y_cut1=Y(((Fs*5+1):Fs*15),:);
len=length(Y)/Fs/10;
%把一首歌切成10s一个片段q切完为止
for i=0:len-1
Y_cut1=Y(((Fs*i+1):Fs*(i+10)),:);
wavwrite(Y_cut1,Fs,bits,['E:/FFOutput/' 'newname' num2str(i) '.wav']);
end
sound(Y_cut1,Fs);