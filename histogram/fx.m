function output_args = fx( input_args )
% f(I0(i,j))  = (I0(i,j) - I0min)/(I0max-I0min)
% input_args �������ص㣬
%inputMax Ϊ���ػҶ����ֵ�㣬inputMin Ϊ���ػҶ���Сֵ��
inputMin=0;
inputMax=255;
output_args= (input_args-inputMin) / (inputMax-inputMin);
end

