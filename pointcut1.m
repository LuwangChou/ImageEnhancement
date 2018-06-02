%读一个文件夹中的多个wav文件，然后拼接在一起
clc;
clear all;
folder = 'F:/FFOutput/';
files = dir([folder '*.wav']);%读取文件夹下的所有wav文件
%files = dir(folder);
%length(files)
for i=1:length(files)
file = [folder files(i).name];
    try
        [Y,Fs,bits] = wavread(file);%返回值分别为Y读取片段，Fs采样率默认为44100，bits编码位数一般为16位
    catch
        warning(['读取文件 ' file ' 出错，可能不支持该文件格式。']);
    end
    try
        wavwrite(Y_cutall,Fs,bits,['F:/FFOutput/' 'newname' num2str(i) '.wav']);
    catch
        warning(['写出文件 ' file ' 出错，写出地址错误。']);
    end
end 