%����ͼ����ǿ�㷨S=c*log(r+1) �˴�cȡ255/log(256)
imageFV=imread('F:\fingervein_test.png');   %����ͼ��
%c=255/log(256);
c=2.5;
imageFV=mat2gray(imageFV);   %�����任��֧��uint8���͵����ݣ���һ�������һ��Ϊ�Ҷ�ͼ������ݸ�ʽ
rstFV=c*log(imageFV+1);
otsuShow(imageFV,rstFV);