%��һ���ļ����еĶ��wav�ļ���Ȼ��ƴ����һ��
clc;
clear all;
folder = 'F:/FFOutput/';
files = dir([folder '*.wav']);%��ȡ�ļ����µ�����wav�ļ�
%files = dir(folder);
%length(files)
for i=1:length(files)
file = [folder files(i).name];
    try
        [Y,Fs,bits] = wavread(file);%����ֵ�ֱ�ΪY��ȡƬ�Σ�Fs������Ĭ��Ϊ44100��bits����λ��һ��Ϊ16λ
    catch
        warning(['��ȡ�ļ� ' file ' �������ܲ�֧�ָ��ļ���ʽ��']);
    end
    try
        wavwrite(Y_cutall,Fs,bits,['F:/FFOutput/' 'newname' num2str(i) '.wav']);
    catch
        warning(['д���ļ� ' file ' ����д����ַ����']);
    end
end 