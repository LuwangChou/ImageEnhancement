% 阈值的选择
%产生白噪声
y=randn(1,1000);
thr1=thselect(y,'rigrsure')
thr2=thselect(y,'sqtwolog')
thr1=thselect(y,'heursure')
thr1=thselect(y,'minimaxi')


%设置信噪比和随机种子值
    snr=4;
%     init=20556155866;
%产生原始信号sref和被高斯白噪声污染的信号s
    [sref,s]=wnoise(1,11,snr);

%用sym8小波对信号s进行三层分解并对细节系数选用sure阈值模式和尺度噪声
   xd=wden(s,'heursure','s','one',3,'sym8');
%显示信号波形
subplot(311);
plot(sref);
xlabel('样本序号 n');
ylabel('幅值 A');
title('参考信号');
subplot(312);
plot(s);
xlabel('样本序号 n');
ylabel('幅值 A');
title('含噪信号');
subplot(313);
plot(xd);
xlabel('样本序号 n');
ylabel('幅值 A');
title('消噪信号');