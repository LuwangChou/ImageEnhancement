% ��ֵ��ѡ��
%����������
y=randn(1,1000);
thr1=thselect(y,'rigrsure')
thr2=thselect(y,'sqtwolog')
thr1=thselect(y,'heursure')
thr1=thselect(y,'minimaxi')


%��������Ⱥ��������ֵ
    snr=4;
%     init=20556155866;
%����ԭʼ�ź�sref�ͱ���˹��������Ⱦ���ź�s
    [sref,s]=wnoise(1,11,snr);

%��sym8С�����ź�s��������ֽⲢ��ϸ��ϵ��ѡ��sure��ֵģʽ�ͳ߶�����
   xd=wden(s,'heursure','s','one',3,'sym8');
%��ʾ�źŲ���
subplot(311);
plot(sref);
xlabel('������� n');
ylabel('��ֵ A');
title('�ο��ź�');
subplot(312);
plot(s);
xlabel('������� n');
ylabel('��ֵ A');
title('�����ź�');
subplot(313);
plot(xd);
xlabel('������� n');
ylabel('��ֵ A');
title('�����ź�');